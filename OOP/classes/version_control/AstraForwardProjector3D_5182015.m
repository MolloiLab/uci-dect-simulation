classdef AstraForwardProjector3D < ForwardProjector_Base
%ASTRAFORWARDPROJECTOR 2D forward projector using ASTRA
%
%

    properties
        % dimensionality of the projection geometry
        dimensionality
        % size in pixels of the generated sinograms
        sinogram_size 
        
        Phantom
        ProjectionGeometry
        
        % private properties
        useGPU
        is_ASTRA_initialized
        super_sampling_factor
        % astra identifiers
        astra_id_algorithm
        astra_id_projector
        astra_id_volume
        astra_id_sino
        
        astra_proj_type
    end
        
    methods
        function this = AstraForwardProjector(varargin)
            % Constructor for an ASTRA forward projector object.
            %
            
            narginchk(2,2);
            % Inputs must be a projection geometry and a volume geometry.
            % A phantom object can be substituted instead of a volume geom
            if nargin == 2
                % find the projection geometry
                proj_geom_idx = cellfun(@(x) isa(x, 'ProjectionGeometry'), varargin);
                phantom_idx   = cellfun(@(x) isa(x, 'PhantomBase'), varargin);
                
                this.ProjectionGeometry = varargin{proj_geom_idx};
                this.Phantom = varargin{phantom_idx};
            end
            
            this.dimensionality = this.Phantom.dimensionality;
            this.sinogram_size = [numel(this.ProjectionGeometry.projection_angles),...
                                  this.ProjectionGeometry.detector_size(1)];
            
            this.super_sampling_factor = 0;
            this.is_ASTRA_initialized = 0;
            this.prepareASTRA();
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
        function set.useGPU(this, bool)
            if bool == true && gpuDeviceCount > 0
                this.useGPU = true;
            else
                this.useGPU = false;
            end
        end
        
        % Abstract method implementation
        function setPhantom(this, phantom)
            if ~isa(phantom, 'PhantomBase')
                ME = MException([mfilename ':setPhantom:Input'],...
                        'Input must be an object that inherits from PhantomBase.');
                ME.throw();
            end
            % save a reference to the phantom object
            this.Phantom = phantom;
            % prepare ASTRA to work with the new phantom object
            this.prepareASTRA();
        end
        
        function set.ProjectionGeometry(this, pg)
            this.ProjectionGeometry = pg;
        end
        
        function sinograms = generateSinograms(this, energies)
            % Forward projects to genereate sinograms from the referenced
            % phantom object. The input is a single or array of energies.
            % The return value is an array of lmu sinograms in which the
            % last index varies the energy of the sinogram.
            
            % allocate memory
            sinograms = zeros([this.sinogram_size, numel(energies)]);
            % loop over the different energies
            for energy_idx = 1 : numel(energies)
                energy = energies(energy_idx);
                
                lmu_map = this.Phantom.generateAttenuationMap(energy);
                % store the lmu_map into the ASTRA volume data object
                astra_mex_data2d('store', this.astra_id_volume, lmu_map);
                % zero out the ASTRA sinogram data object
                astra_mex_data2d('store', this.astra_id_sino, 0);
                % run the forward projector and get a sinogram
                astra_mex_algorithm('iterate', this.astra_id_algorithm);
                sino = astra_mex_data2d('get', this.astra_id_sino);
                sinograms(:,:, energy_idx) = squeeze(sino);
            end
        end
        
        function isValid = validate(this)
            isValid = true;
        end
    end % methods
    
    methods %(Access = private)
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
            % Create the volume geometry struct
            pixel_count   = this.Phantom.image_size;
            physical_size = this.Phantom.physical_size;
            %  make the vol_geom
            vol_geom = astra_create_vol_geom(pixel_count(1), pixel_count(2),...
                -physical_size(2)/2, physical_size(2)/2, -physical_size(1)/2, physical_size(1)/2);
            % Create the projection geometry struct from our
            % ProjectionGeometry object
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
                    warning([mfilename ':Nosuper_sampling_factor'],...
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