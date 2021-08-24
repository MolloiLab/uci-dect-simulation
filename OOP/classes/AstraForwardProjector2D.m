classdef AstraForwardProjector2D < ForwardProjector_Base ...
                                 & ForwardProjector_ArrayProjectable
%ASTRAFORWARDPROJECTOR 2D forward projector using ASTRA
%

    properties
        useGPU
        super_sampling_factor
        
        %(Access = private)
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
        function this = AstraForwardProjector2D(varargin)
            % Constructor for an ASTRA forward projector object.
            %
            
            this@ForwardProjector_Base(varargin{:});
            
            this.astra_line_or_strip = 'strip';
            this.super_sampling_factor = 0;
            this.is_ASTRA_initialized = 0;
            
            if gpuDeviceCount == 0
                warning([mfilename ':NoGPU'],...
                    'Using CPU implementation. Consider running on a machine with a CUDA enabled GPU.');
                this.useGPU = 0;
            else
                this.useGPU = 1;
            end
        end


        function delete(this)
            % Delete all of the astra objects that have been created.
            this.deleteASTRA();
        end
        
% % % % % Simple Getters and Setters        
        function set.useGPU(this, bool)
            % Explicitly sets whether or not to use the GPU
            
            % Quick exit if the value won't change
            if this.useGPU == bool
                return
            end
            % Else we make sure that a GPU is available.
            gpu_exists = gpuDeviceCount > 0;
            if bool == true && gpu_exists
                this.useGPU = true;
                % Signal that we need to reallocate ASTRA resources after
                % this change
                this.is_ASTRA_initialized = false;
            elseif bool == true && ~gpu_exists
                warning([mfilename, ':UseGPU'],...
                    'A valid GPU was not detected, reverting to CPU mode.');
                this.useGPU = false;
            else % bool is false but a GPU is available
                this.useGPU = false;
                % Signal that we need to reallocate ASTRA resources after
                % this change
                this.is_ASTRA_initialized = false;
            end
            
        end
        
        
        function set.astra_line_or_strip(this, line_or_strip)
            switch line_or_strip
                case {'line', 'strip'}
                    this.astra_line_or_strip = line_or_strip;
                otherwise
                    error([mfilename, ':BadSetValue'],...
                        'Only valid settings are ''line'' or ''strip''.');
            end 
            if this.useGPU == true
                warning([mfilename, ':Usage'],...
                    '''line'' or ''strip'' has no effect on the GPU algorithm.');
            end
        end
        
% % % % % Implementation of the abstract interfaces 
% The default implementation of generateSinograms from
% ForwardProjector_SingleProjectable is used
        function sino = projectImage(this, image)
            % Projects the image to produce a sinogram.
            % This function does not include input checking and is not
            % meant to be called by the user.
            
            % store the image into the ASTRA volume data object
            astra_mex_data2d('store', this.astra_id_volume, image);
            % zero out the ASTRA sinogram data object
            astra_mex_data2d('store', this.astra_id_sino, 0);
            % run the forward projector
            astra_mex_algorithm('run', this.astra_id_algorithm);
            % get the return value from ASTRA
            sino = astra_mex_data2d('get', this.astra_id_sino);
            % squeeze is necessary to get it in the shape we expect
            sino = squeeze(sino);
            % multiply by the scaling factor to get the right values
            sino = sino .* this.scaling_factor;
        end


        function bool = validate(this)
            % Ensures that this FP can be used to project sinograms
            bool = true;
            % We just need to make sure that ASTRA has been properly
            % initialized and that the scaling factors are computed.
            if ~this.is_ASTRA_initialized
                this.prepareASTRA();
                computeScalingFactor(this);
            end
            
            this.is_valid = bool;
        end
        
    end % methods
    
% % % Internal methods
    methods %(Access = private)
        
        function computeScalingFactor(this)
            % Computes a multiplicative factor that produces the desired
            % values when applied to the sinogram. The scaling factors were
            % determined empirically by running the forward projection
            % through a square of known size and density and checking the
            % resulting values.(See 'testing_ASTRA_Accuracy_2D.m')
            if this.useGPU
                % line vs strip is irrelevant for the GPU
                switch this.ProjectionGeometry.ray_geometry
                    case 'parallel'
                        % 1/det_pix_size
                        scaling = 1 / this.ProjectionGeometry.detector_element_size(1);
                    case 'fanbeam'
                        scaling = 1;
                end
            else % using CPU algorithms
                switch this.astra_line_or_strip
                    case 'line'
                        scaling = 1;
                    case 'strip'
                        % 1/det_pix_size
                        scaling = 1/this.ProjectionGeometry.detector_element_size(1);
                        
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
        
        
        function prepareASTRA(this)
            % Initializes the ASTRA package based on the information
            % currently stored in this object.
            
            % Check if astra has been initialized, if so, we must release
            % all the memory that was allocated and recreate it. We assume
            % that calls to this function will force reallocation of
            % resources.
            if this.is_ASTRA_initialized
                % clear memory used by ASTRA
                this.deleteASTRA();
                this.is_ASTRA_initialized = 0;
            end
            
            % Generate all ASTRA objects
            % Create the vol_geom struct
            pixel_count   = this.VolumeGeometry.volume_size;
            physical_size = this.VolumeGeometry.physical_size;
            %  make the vol_geom
            vol_geom = astra_create_vol_geom(pixel_count(1), pixel_count(2),...
                -physical_size(2)/2, physical_size(2)/2, -physical_size(1)/2, physical_size(1)/2);
           
            % Create the proj_geom struct from our ProjectionGeometry
            % object
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
            
            % Create the ASTRA data objects for the input volume and the
            % output sinogram
            this.astra_id_sino   = astra_mex_data2d('create','-sino', proj_geom, 0);
            this.astra_id_volume = astra_mex_data2d('create','-vol', vol_geom, 0);
            
            % Create an algorithm object in ASTRA
            %  CPU vs GPU algorithm
            if this.useGPU
                cfg = astra_struct('FP_CUDA');
                % super_sampling_factor is only available on the GPU
                if this.super_sampling_factor > 0
                    cfg.option.DetectorSuperSampling = this.super_sampling_factor;
                end
                
                % Create a projection object in ASTRA
                this.astra_id_projector = astra_create_projector(...
                    'cuda', proj_geom, vol_geom);
                
            else % we are using the CPU
                cfg = astra_struct('FP');
                if this.super_sampling_factor > 0
                    warning([mfilename ':super_sampling_factor'],...
                        'Detector super sampling is only available on the GPU algorithm.');
                end
                % Create a projection object in ASTRA
                this.astra_id_projector = astra_create_projector(...
                    this.astra_proj_type, proj_geom, vol_geom);
            end
            cfg.ProjectorId = this.astra_id_projector;
            cfg.ProjectionDataId = this.astra_id_sino;
            cfg.VolumeDataId = this.astra_id_volume;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
            % Reflect the successful initialization in the object
            this.is_ASTRA_initialized = 1;
        end
        
        function deleteASTRA(this)
            % Release all internal ASTRA objects
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
    end
    
end % classdef