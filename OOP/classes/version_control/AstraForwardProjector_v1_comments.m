classdef AstraForwardProjector < ForwardProjectorBase
%ASTRAFORWARDPROJECTOR 2D forward projector using ASTRA
%
%

% The following are inherited from the ForwardProjectorBase
%     properties
%         VolumeGeometry % geometry of the input volume
%         ProjectionGeometry % geometry of the projections
%     end
%     
%     properties (Dependent)
%         % dimensionality of the projection geometry
%         dimensionality
%         % size in pixels of the generated sinograms
%         sinogram_size
%     end

    properties
        is_valid
    end

    properties %(Access = private)
        useGPU
        is_ASTRA_initialized
        super_sampling_factor
        
        % astra identifiers
        astra_id_algorithm
        astra_id_projector
        astra_id_volume
        astra_id_sino
        
        astra_proj_type
        
        scaling_factor
    end
        
    methods
        function this = AstraForwardProjector(varargin)
            % Constructor for an ASTRA forward projector object.
            %
            
            this@ForwardProjectorBase(varargin{:});
            % A forward projector
%             if nargin == > 0
%                 proj_geom_idx  = cellfun(@(x) isa(x, 'ProjectionGeometry'), varargin);
%                 vol_geom_idx   = cellfun(@(x) isa(x, 'VolumeGeometry'), varargin);
%                 
%                 this.ProjectionGeometry = varargin{proj_geom_idx};
%                 this.VolumeGeometry     = varargin{vol_geom_idx};
%             end
            
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
            if ~isempty(this.astra_id_algorithm)
                astra_mex_algorithm('delete', this.astra_id_algorithm);
            end
            if ~isempty(this.astra_id_projector)
                astra_mex_projector('delete', this.astra_id_projector);
            end
            if ~isempty(this.astra_id_volume)
                astra_mex_data2d('delete', this.astra_id_volume);
            end
            if ~isempty(this.astra_id_sino)
                astra_mex_data2d('delete', this.astra_id_sino);
            end
        end
        
        % Simple getters and setters
%         function dims = get.dimensionality(this)
%             dims = this.VolumeGeometry.dimensionality;
%         end
%         
%         function ss = get.sinogram_size(this)
%             ss = [numel(this.ProjectionGeometry.projection_angles),...
%                         this.ProjectionGeometry.detector_size(1)];
%         end
        
        function set.useGPU(this, bool)
            if bool == true && gpuDeviceCount > 0
                this.useGPU = true;
            else
                this.useGPU = false;
            end
        end
        
%         % Abstract method implementation
%         function set.VolumeGeometry(this, vg)
%             if ~isa(vg, 'VolumeGeometry')
%                 ME = MException([mfilename ':IncorrectInput'],...
%                         'Input must be an object that inherits from PhantomBase.');
%                 ME.throw();
%             end
%             % save a reference to the phantom object
%             this.VolumeGeometry = vg;
%             % prepare ASTRA to work with the new phantom object
%             this.is_ASTRA_initialized = false;
%         end
%         
%         function set.ProjectionGeometry(this, pg)
%             this.ProjectionGeometry = pg;
%         end
        
        function sinograms = generateSinograms(this, Phantom, energies)
            % Forward projects to genereate sinograms from the referenced
            % phantom object. The input is a single or array of energies.
            % The return value is an array of lmu sinograms in which the
            % last index varies the energy of the sinogram.
            
            if ~this.is_valid
                this.validate();
            end
            
%             % the following function is called as a workaround for
%             % erroneous results seen if a GPU algorithm is ran twice.
%             % Instead we create a new algorithm each time.
%             this.remakeAlgorithm();
            
            % allocate memory
            sinograms = zeros([this.sinogram_size, numel(energies)]);
            % loop over the different energies
            for energy_idx = 1 : numel(energies)
                energy = energies(energy_idx);
                
                lmu_map = Phantom.generateAttenuationMap(energy);
                % store the lmu_map into the ASTRA volume data object
                astra_mex_data2d('store', this.astra_id_volume, lmu_map);
                % zero out the ASTRA sinogram data object
                astra_mex_data2d('store', this.astra_id_sino, 0);
                % run the forward projector
                astra_mex_algorithm('run', this.astra_id_algorithm);
                % get the return value from ASTRA
                sino = astra_mex_data2d('get', this.astra_id_sino);
                % squeeze is necessary to get it in the shape we expect
                sino = squeeze(sino);
                % multiply by the scaling factor to get the right units
                sino = sino .* this.scaling_factor;
                % save the result
                sinograms(:,:, energy_idx) = sino;
            end
        end
        
        function bool = validate(this)
            bool = true;
            if ~this.is_ASTRA_initialized
                this.prepareASTRA();
            end
            this.is_valid = bool;
        end
    end % methods
    
    methods %(Access = private)
        
        function computeScalingFactor(this)
            % Computes a multiplicative factor that produces the desired
            % values when applied to the sinogram.
            % The values were determined by running the forward projection
            % through a square of known size and density and checking the
            % resulting values.
            if this.useGPU
            else
                if this.astra_proj_typ
            end
        end
        
        function remakeAlgorithm(this)
            % Workaround for a bug where ASTRA's GPU projector returns
            % incorrect results if ran twice.
            if ~this.useGPU
                return;
            end
            % release the memory of the previous algorithm
            if ~isempty(this.astra_id_algorithm)
                astra_mex_algorithm('delete', this.astra_id_algorithm);
            end
            % create a new one
            cfg = astra_struct('FP_CUDA');
            % super_sampling_factor is only available on the GPU
            if this.super_sampling_factor > 0
                cfg.option.Detectorsuper_sampling_factor = this.super_sampling_factor;
            end
            cfg.ProjectorId = this.astra_id_projector;
            cfg.ProjectionDataId = this.astra_id_sino;
            cfg.VolumeDataId = this.astra_id_volume;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
        end
        
        function prepareASTRA(this)
            % Initializes the ASTRA package based on the information
            % currently stored in this object.
            
            % Check if astra has been initialized, if so, we must release
            % all the memory that was allocated and recreate it
            if this.is_ASTRA_initialized
                % clearing of memeory is contained in the delete function
                this.delete();
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
                this.astra_proj_type = 'strip';
                proj_geom = astra_create_proj_geom('parallel',...
                    pg.detector_element_size(1),... detector spacing
                    pg.detector_size(1),...
                    pg.projection_angles);
            elseif strcmpi(pg.ray_geometry, 'fanbeam')
                this.astra_proj_type = 'strip_fanflat';
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
            
            % Create a projection object in ASTRA
            this.astra_id_projector = astra_create_projector(this.astra_proj_type,...
                                            proj_geom, vol_geom);
            
            % Create an algorithm object in ASTRA
            %  CPU vs GPU algorithm
            if this.useGPU
                cfg = astra_struct('FP_CUDA');
                % super_sampling_factor is only available on the GPU
                if this.super_sampling_factor > 0
                    cfg.option.Detectorsuper_sampling_factor = this.super_sampling_factor;
                end
            else
                cfg = astra_struct('FP');
                if this.super_sampling_factor > 0
                    warning([mfilename ':super_sampling_factor'],...
                        'Detector super sampling is only available on the GPU algorithm.');
                end
            end
            cfg.ProjectorId = this.astra_id_projector;
            cfg.ProjectionDataId = this.astra_id_sino;
            cfg.VolumeDataId = this.astra_id_volume;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
            % Reflect the successful initialization in the object
            this.is_ASTRA_initialized = 1;
        end
        
    end
    
end % classdef