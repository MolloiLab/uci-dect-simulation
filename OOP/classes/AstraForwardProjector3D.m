classdef AstraForwardProjector3D < ForwardProjector_Base ...
                                 & ForwardProjector_ArrayProjectable
%ASTRAFORWARDPROJECTOR3D 3D Forward projector using ASTRA
%
%

    properties %(Access = private)
        is_ASTRA_initialized
        super_sampling_factor
        
        % astra identifiers
        astra_id_algorithm
        astra_id_volume
        astra_id_sino
    end
        
    methods
        function this = AstraForwardProjector3D(varargin)
            % Constructor for an ASTRA forward projector object.
            
            % Base class implements parsing of the two geometries
            this@ForwardProjector_Base(varargin{:});
            
            % Check to ensure that the input volume geometry is isotropic
            % since ASTRA does not support anisotropic 3D volumes
            if ~all(this.VolumeGeometry.element_size == this.VolumeGeometry.element_size(1))
                error([mfilename ':NeedIsotropicVoxels'],...
                    'The 3D ASTRA aglorithms require an isotropic input volume.');
            end
            
            if gpuDeviceCount == 0
                error([mfilename ':NoGPU'],...
                    'The 3D ASTRA aglorithms require a CUDA enabled GPU.');
            end
            
            this.super_sampling_factor = 0;
            this.is_ASTRA_initialized = 0;
        end


        function delete(this)
            % Delete all of the astra objects that have been created.
            this.deleteASTRA();
        end
        
% % % % % Implementation of the abstract interface from ForwardProjector_ArrayProjectable

        % The default implementation of generateSinograms from
        % ForwardProjector_SingleProjectable is used based on the function
        % below
        function sino = projectImage(this, image)
            % Projects the image to produce a sinogram.
            % This function does not include input checking and is not
            % meant to be called directly by the user.
            
            % NB: We must convert the units of attenuation in the input
            % phantom into the units expected by the algorithm, i.e. we
            % want units of 1/image_pix_size. With this conversion, the
            % resulting sinogram will be unitless.
            astra_mex_data3d('store', this.astra_id_volume, image .* this.VolumeGeometry.element_size(1) );
            % zero out the ASTRA sinogram data object
            astra_mex_data3d('store', this.astra_id_sino, 0);

            % run the algorithm
            astra_mex_algorithm('iterate', this.astra_id_algorithm);

            % retreive the results
            sino = astra_mex_data3d('get', this.astra_id_sino);
            
            % some transformations necessary for us to get the data in the
            % format that is expected as output, i.e.
            sino = permute(sino, [2,1,3]);
        end

        function bool = validate(this)
            bool = true;
            if ~this.is_ASTRA_initialized
                this.prepareASTRA();
            end
%             computeScalingFactor(this);
            this.is_valid = bool;
        end
        
    end % methods
    
% % % % % Internal methods
    methods %(Access = private)
        
        function prepareASTRA(this)
            % Initializes the ASTRA package based on the information
            % currently stored in this object.
            
            % Check if astra has been initialized, if so, we must release
            % all the memory that was allocated and recreate it
            if this.is_ASTRA_initialized
                % clear memory used by ASTRA
                this.deleteASTRA();
                this.is_ASTRA_initialized = 0;
            end
            
            % Generate all ASTRA objects
            % Create the volume geometry struct
            pixel_count   = this.VolumeGeometry.volume_size;
            % * 3D ASTRA functions do not have a element size parameter.
            %   The units are set by the volume geometry which is assumed
            %   to have unit square voxels.
            % We need the physical size of the input voxel to do the proper
            % conversions of other distances
            element_size = this.VolumeGeometry.element_size(1);
            
            vol_geom = astra_create_vol_geom(pixel_count(2), pixel_count(1), pixel_count(3));

            % Create the projection geometry struct from our ProjectionGeometry object
            %  alias for the ProjectionGeometry
            PG = this.ProjectionGeometry;
            if strcmpi(PG.ray_geometry, 'parallel')
                proj_geom = astra_create_proj_geom('parallel3d',...
                    PG.detector_element_size(1)/element_size,... det_spacing_x
                    PG.detector_element_size(2)/element_size,... det_spacing_y
                    PG.detector_size(2),... det_row_count
                    PG.detector_size(1),... det_col_count
                    PG.projection_angles... angles
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

            % Create the ASTRA data objects for the input volume and the
            % output sinogram
            this.astra_id_sino   = astra_mex_data3d('create','-sinocone', proj_geom, 0);
            this.astra_id_volume = astra_mex_data3d('create','-vol', vol_geom, 0);

            cfg = astra_struct('FP3D_CUDA');
            cfg.ProjectionDataId = this.astra_id_sino;
            cfg.VolumeDataId = this.astra_id_volume;
            % Inputting 0 for the options.DetectorSuperSampling will cause
            % the creation of the algorithm to fail, so only assign to it
            % if we need to!
            if this.super_sampling_factor > 0
                cfg.options.DetectorSuperSampling = this.super_sampling_factor;
            end
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
            if ~isempty(this.astra_id_volume)
                astra_mex_data3d('delete', this.astra_id_volume);
                this.astra_id_volume = [];
            end
            if ~isempty(this.astra_id_sino)
                astra_mex_data3d('delete', this.astra_id_sino);
                this.astra_id_sino = [];
            end
        end
        
    end
    
end % classdef