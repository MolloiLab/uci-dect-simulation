classdef AstraFilteredBackProjector3D < BackProjector_Base
%ASTRAFORWARDPROJECTOR 3D back projector using ASTRA
%

% TODO: There are many features of the ASTRA package that are not yet
% accessbile through this interface, eg. Parker weighting for half-scans.
    
    properties
% % % % % Inherited properties from the Base class
%         ProjectionGeometry
%         VolumeGeometry
%         is_valid
%        Dependent:
%         dimensionality
%         sinogram_size
        
        super_sampling_factor
        
        % private properties
        is_ASTRA_initialized
        
        % astra identifiers
        astra_id_algorithm
        astra_id_volume
        astra_id_sino
    end
        
    methods
        function this = AstraFilteredBackProjector3D(varargin)
            % Constructor for an ASTRA back projector object.
            %
            % Requires a ProjectionGeometry and VolumeGeometry as inputs.
            
            % Base class implements parsing of the two geometries
            this@BackProjector_Base(varargin{:});
            
            % Some default values
            this.super_sampling_factor = 0;
            this.is_ASTRA_initialized = false;

            if gpuDeviceCount == 0
                error([mfilename ':NoGPU'],...
                    'The 3D ASTRA aglorithms require a CUDA enabled GPU.');
            end
        end
        
        function delete(this)
            % Delete all of the astra objects that have been created in
            % this instance of the object.
            if ~isempty(this.astra_id_algorithm)
                astra_mex_algorithm('delete', this.astra_id_algorithm);
                this.astra_id_algorithm = [];
            end
            if ~isempty(this.astra_id_volume)
                astra_mex_data3d('delete', this.astra_id_volume);
                this.astra_id_volume = [];
            end
            if ~isempty(this.astra_id_sino)
                astra_mex_data3d('delete', this.astra_id_sino);
                this.astra_id_sino = [];
            end
        end
        
% % % % % Simple getters and setters

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
            
            % Send the sinogram array into ASTRA
            % first, we must transform the array to have the right ordering
            % of the dimensions: [X Theta Y];
            sinogram = permute(sinogram, [2,1,3]);
%             astra_mex_data3d('store', this.astra_id_sino, 0);
            astra_mex_data3d('store', this.astra_id_sino, sinogram);
            % zero out the ASTRA volume data object
            astra_mex_data3d('store', this.astra_id_volume, 0);
            % run the back projector and get the resulting volume
            astra_mex_algorithm('run', this.astra_id_algorithm);
            volume = astra_mex_data3d('get', this.astra_id_volume);
            
            % do a unit conversion since, internally, ASTRA assumes that
            % the reconstructed volume has pixels with sides of unity
            % length
            volume = volume .* this.VolumeGeometry.element_size(1);
            
            % Workaround for a bug where ASTRA's GPU projector returns
            % incorrect results if ran twice.
            this.remakeAlgorithm();
        end
        
        function isValid = validate(this)
            if ~this.is_ASTRA_initialized
                this.prepareASTRA();
            end
            isValid = this.is_ASTRA_initialized;
        end
    end % methods
    
    methods %(Access = private)
        
        function remakeAlgorithm(this)
            % Workaround for a bug where ASTRA's GPU projector returns
            % incorrect results if ran twice.
            
            % release the memory of the previous algorithm
            astra_mex_algorithm('delete', this.astra_id_algorithm);
            
            % create a new one
            cfg = astra_struct('FDK_CUDA');
            if this.super_sampling_factor > 0
                    cfg.option.Detectorsuper_sampling_factor = this.super_sampling_factor;
            end
            
            cfg.ProjectionDataId        = this.astra_id_sino;
            cfg.ReconstructionDataId    = this.astra_id_volume;
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
        end
        
        
        function prepareASTRA(this)
            % Initializes the ASTRA package based on the information
            % currently stored in this object.
            
            % Check if astra has been initialized, if so, we must release
            % all the memory that was allocated and recreate it
            if this.is_ASTRA_initialized
                % releasing of the memory is handled by the delete function
                this.delete();
                this.is_ASTRA_initialized = false;
            end

            % Generate all ASTRA objects
            % Create the volume geometry struct
            pixel_count   = this.VolumeGeometry.volume_size;
            % * 3D ASTRA functions do not have a element size parameter.
            %   The units are set by the volume geometry which is assumed
            %   to have unit square voxels.
            % We need the physical size of the voxel to do the proper
            % conversions of other distances
            element_size = this.VolumeGeometry.element_size(1);
            
            vol_geom = astra_create_vol_geom(pixel_count(2), pixel_count(1), pixel_count(3));

            % Create the projection geometry struct from our
            % ProjectionGeometry object
            %  alias for the ProjectionGeometry
            PG = this.ProjectionGeometry;
            if strcmpi(PG.ray_geometry, 'parallel')
                warning([mfilename ':OnlyConeBeam'],...
                    'Only the conebeam (''fanbeam'') geometry is natively supported with FDK.\nFaking parallel beam with a large source to object distance.');
                proj_geom = astra_create_proj_geom('cone',...
                    PG.detector_element_size(1)/element_size,... det_spacing_x
                    PG.detector_element_size(2)/element_size,... det_spacing_y
                    PG.detector_size(2),... det_row_count
                    PG.detector_size(1),... det_col_count
                    PG.projection_angles,... angles
                    100000000,... source_origin
                    1000 ... origin_det
                    );
            elseif strcmpi(PG.ray_geometry, 'fanbeam')
                proj_geom = astra_create_proj_geom('cone',...
                    PG.detector_element_size(1)/element_size,... det_spacing_x
                    PG.detector_element_size(2)/element_size,... det_spacing_y
                    PG.detector_size(2),... det_row_count
                    PG.detector_size(1),... det_col_count
                    PG.projection_angles,... angles
                    PG.source_object_distance/element_size,... source_origin
                    PG.object_detector_distance/element_size... origin_det
                    );
            end
            
            % Create the ASTRA data objects for the reconstruction volume
            % and the output sinogram
            this.astra_id_sino   = astra_mex_data3d('create', '-sino', proj_geom, 0);
            this.astra_id_volume = astra_mex_data3d('create', '-vol', vol_geom, 0);

            % Create an algorithm object in ASTRA
            cfg = astra_struct('FDK_CUDA');
            cfg.ProjectionDataId     = this.astra_id_sino;
            cfg.ReconstructionDataId = this.astra_id_volume;
            if this.super_sampling_factor > 0
                cfg.option.VoxelSuperSampling = this.super_sampling_factor;
            end
            
            this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
            % Reflect the successful initialization in the properties
            this.is_ASTRA_initialized = true;
        end
        
    end
    
end % classdef