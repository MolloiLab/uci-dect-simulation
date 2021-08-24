classdef AstraFilteredBackProjector2D < BackProjector_Base
%ASTRAFORWARDPROJECTOR 3D backprojector using ASTRA
%
%

    properties
% % % % % Inherited properties from the Base class
%         ProjectionGeometry
%         VolumeGeometry
%         is_valid
%        Dependent:
%         dimensionality
%         sinogram_size

        filter_type
        super_sampling_factor
        
        % private properties
        useGPU
        is_ASTRA_initialized
        astra_line_or_strip
        astra_proj_type
        scaling_factor
        
        % astra identifiers
        astra_id_algorithm
        astra_id_projector
        astra_id_volume
        astra_id_sino
    end
        
    methods
        function this = AstraFilteredBackProjector2D(varargin)
            % Constructor for an ASTRA back projector object.
            %
            % Requires a ProjectionGeometry and VolumeGeometry as inputs.
            
            % Base class implements parsing of the two geometries
            this@BackProjector_Base(varargin{:});
            % Establish some default values
            this.filter_type = 'ram-lak';
%             this.filter_type = 'shepp-logan';
%             this.filter_type = 'hamming';
            this.super_sampling_factor = 0;
            this.astra_line_or_strip = 'strip';
            this.is_ASTRA_initialized = false;
            if length(varargin) > 2
                BP_params = varargin{3};
                params = fieldnames(varargin{3});
                for i = params'
                    this.(i{1}) = BP_params.(i{1});
                end
                
            end
           
            if gpuDeviceCount == 0
                warning([mfilename ':NoGPU'],...
                    'Using CPU implementation. Consider running on a machine with a CUDA enabled GPU.');
                this.useGPU = 0;
            else
                this.useGPU = 1;
            end
        end
        
        function delete(this)
            % Delete all of the astra objects that have been created in
            % this instance of the object.
            if ~isempty(this.astra_id_algorithm)
                astra_mex_algorithm('delete', this.astra_id_algorithm);
                this.astra_id_algorithm = [];
            end
            if ~isempty(this.astra_id_projector)
                astra_mex_projector('delete', this.astra_id_projector);
                this.astra_id_projector = [];
            end
            if ~isempty(this.astra_id_volume)
                astra_mex_data2d('delete', this.astra_id_volume);
                this.astra_id_volume = [];
            end
            if ~isempty(this.astra_id_sino)
                astra_mex_data2d('delete', this.astra_id_sino);
                this.astra_id_sino = [];
            end
        end
        
        % Simple getters and setters
        function set.useGPU(this, bool)
            if bool == true 
                if gpuDeviceCount > 0
                    this.useGPU = true;
                else % no GPU detected
                    warning([mfilename ':NoGPU'],...
                        'No GPU detected.');
                    this.useGPU = false;
                end
            else
                this.useGPU = false;
            end
        end
        
        % 
        function volume = reconstruct(this, sinogram)
            % Reconstructs the passed in sinogram

            % Make sure the back projector is valid and consistent
            if ~this.validate
                % validate is expected to return warnings where changes
                % must be made
                error([mfilename ':NotValid'],...
                    'Object needs more information before it can be used to reconstruct.');
            end
            
            if this.ProjectionGeometry.sinogram_size ~= size(sinogram)
                error([mfilename, ':ReconstructSizeMismatch'],...
					'The stored Projection Geometry does not match the size of the inputted sinogram');
            end  
            
            % send the sinogram array into ASTRA
            astra_mex_data2d('store', this.astra_id_sino, 0);
            astra_mex_data2d('store', this.astra_id_sino, sinogram);
            % zero out the ASTRA volume data object
            astra_mex_data2d('store', this.astra_id_volume, 0);
            % run the back projector and get the resulting volume
            astra_mex_algorithm('run', this.astra_id_algorithm);
            volume = astra_mex_data2d('get', this.astra_id_volume);
            
            % adjust the resulting pixels by the scaling factor
            volume = volume .* this.scaling_factor;
            
            % Workaround for a bug where ASTRA's GPU projector returns
            % incorrect results if ran twice.
            if this.useGPU
                this.remakeAlgorithm();
            end
        end
        
        function bool = validate(this)
            if ~this.is_ASTRA_initialized
                this.prepareASTRA();
                this.computeScalingFactor();
            end
            
            % Check for GPU recon with fanflat since this combination
            % results in erroneous pixel values
            if this.useGPU && strcmpi(this.ProjectionGeometry.ray_geometry, 'fanbeam')
                warning('2D GPU recon with fanbeam results in erroneous pixel values.');
            end
            
            bool = this.is_ASTRA_initialized;
        end
    end % methods
    
    methods %(Access = private)
        
        function computeScalingFactor(this)
            % Computes a multiplicative factor that produces the desired
            % values when applied to the final volume. The scaling factors
            % were determined empirically by running the forward projection
            % through a square of known size and density and checking the
            % resulting values.(See 'testing_ASTRA_Accuracy_2D.m')
            % 
            % fanbeam GPU reconstructions have strange results and I do not
            % have a correction factor for that case that works yet.
            if this.useGPU
                % line vs strip is irrelevant for the GPU
                switch this.ProjectionGeometry.ray_geometry
                    case 'parallel'
                        % image_pix_size/det_pix_size
                        scaling = 1;
                    case 'fanbeam'
                        % Scaling factor determined, as emailed from ASTRA.
                        N =  length(this.ProjectionGeometry.projection_angles);
                        scaling = 2*N/pi;
                end
            else % using CPU algorithms
                switch this.astra_line_or_strip
                    case 'line'
                        % 1/(recon_pix_size)^2
                        scaling = 1/(this.VolumeGeometry.element_size(1)^2);
                    case 'strip'
                        % 1/(recon_pix_size)^2/det_pix_size
                        scaling = 1/(this.VolumeGeometry.element_size(1)^2)/this.ProjectionGeometry.detector_element_size(1);
                        
                        % additional factor of the magnification is
                        % required for the fanbeam geometry (only for
                        % strip)
                        if strcmp(this.ProjectionGeometry.ray_geometry, 'fanbeam')
                            scaling = scaling * this.ProjectionGeometry.magnification;
                        end
                end
            end
            % Save the necessary scaling factor
            this.scaling_factor = scaling;
        end
        
        function remakeAlgorithm(this)
            % Workaround for a bug where ASTRA's GPU projector returns
            % incorrect results if ran twice.
            
            % release the memory of the previous algorithm
            astra_mex_algorithm('delete', this.astra_id_algorithm);
            
            % create a new one
            cfg = astra_struct('FBP_CUDA');
            if this.super_sampling_factor > 0
                    cfg.option.VoxelSuperSampling = this.super_sampling_factor;
            end
            
            cfg.ProjectorId             = this.astra_id_projector;
            cfg.ProjectionDataId        = this.astra_id_sino;
            cfg.ReconstructionDataId    = this.astra_id_volume;
%             cfg.VolumeDataId            = this.astra_id_volume;
            cfg.FilterType              = this.filter_type;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
        end
        
        
        function prepareASTRA(this)
            % Initializes the ASTRA package based on the information
            % currently stored in this object.
            
            % Check if astra has been initialized, if so, we must release
            % all the memory that was allocated and recreate it
            if this.is_ASTRA_initialized
                this.delete();
                this.is_ASTRA_initialized = false;
            end

            % Generate all ASTRA objects
            % Create the volume geometry struct
            pixel_count   = this.VolumeGeometry.volume_size;
            physical_size = this.VolumeGeometry.physical_size;
            %  make the vol_geom
            vol_geom = astra_create_vol_geom(pixel_count(1), pixel_count(2),... 
                -physical_size(2)/2, physical_size(2)/2, -physical_size(1)/2, physical_size(1)/2);

            % Create the projection geometry struct from our
            % ProjectionGeometry object
            %  alias for the ProjectionGeometry
            pg = this.ProjectionGeometry;
            if strcmpi(pg.ray_geometry, 'parallel')
                this.astra_proj_type = this.astra_line_or_strip;
                proj_geom = astra_create_proj_geom('parallel',...
                    pg.detector_element_size(1),... detector spacing
                    pg.detector_size(1),...
                    pg.projection_angles);
            elseif strcmpi(pg.ray_geometry, 'fanbeam')
                this.astra_proj_type = [this.astra_line_or_strip '_fanflat'];
                proj_geom = astra_create_proj_geom('fanflat',...
                    pg.detector_element_size(1),... detector spacing
                    pg.detector_size(1),...
                    pg.projection_angles,...
                    pg.source_object_distance,...
                    pg.object_detector_distance);
            end
            
            % Create the ASTRA data objects for the reconstruction volume
            % and the output sinogram
            this.astra_id_sino   = astra_mex_data2d('create', '-sino', proj_geom, 0);
            this.astra_id_volume = astra_mex_data2d('create', '-vol', vol_geom, 0);
            
            % Create a projection object in ASTRA
            this.astra_id_projector = astra_create_projector(this.astra_proj_type,...
                                            proj_geom, vol_geom);

            % Create an algorithm object in ASTRA
            %  CPU vs GPU algorithm
            if this.useGPU
                cfg = astra_struct('FBP_CUDA');
                % super_sampling_factor is only available on the GPU
                if this.super_sampling_factor > 0
                    cfg.option.Detectorsuper_sampling_factor = this.super_sampling_factor;
                end
            else % using the CPU
                cfg = astra_struct('FBP');
                if this.super_sampling_factor > 0
                    warning([mfilename ':Nosuper_sampling_factor'],...
                        'Detector super sampling is only available on the GPU algorithm.');
                end
            end
            cfg.ProjectorId          = this.astra_id_projector;
            cfg.ProjectionDataId     = this.astra_id_sino;
            cfg.ReconstructionDataId = this.astra_id_volume;
            cfg.FilterType           = this.filter_type;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
            % Reflect the successful initialization in the properties
            this.is_ASTRA_initialized = true;
        end
        
    end
    
end % classdef