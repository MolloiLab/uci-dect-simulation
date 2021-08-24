classdef ProjectionGeometry
%PROJECTIONGEOMETRY Class to describe and define how projections are created

    
    properties (Dependent)
        dimensionality
        magnification
        sinogram_size
    end

    properties
        % can be 'parallel' or 'fanbeam'
        ray_geometry
        
        % array with the number of elements in the detector
        detector_size
        
        % the size of the detector elements in physical units
        detector_element_size
        
        % array of the projection angles in radians
        projection_angles
        
        source_object_distance % in physical units
        object_detector_distance % in physical units
    end
    
    methods (Static)
        function cfg = input_struct(fanOrParallel)
            % Returns a struct with the required fields to use as an input
            % into the constructor to create the ProjectionGeometry.
            
            % Input checking
            if ~strcmpi(fanOrParallel, 'parallel') && ~strcmp(fanOrParallel, 'fanbeam')
                ME = MException([mfilename ':input_struct'],...
                        'Input must be either "fanbeam" or "parallel".');
                ME.throw();
            end
            % Create an struct with named fields but empty data
            cfg = struct;
            cfg.ray_geometry = fanOrParallel;
            cfg.detector_size = [];
            cfg.detector_element_size = [];
            cfg.projection_angles = [];
            % additional configuration for fanbeam
            if strcmpi(fanOrParallel, 'fanbeam')
                cfg.source_object_distance = 0;
                cfg.object_detector_distance = 0;
            end
        end
    end
    
    methods
        function this = ProjectionGeometry(config)
            % Constructor for a ProjectionGeometry object
            
            % allow for the creation of an empty object
            if nargin == 0
                return
            end
            
            % if parallel geometry, just set the SOD to a large number and
            % the ODD to something finite (but should be outside the
            % object). Doing so makes it easier to develop a FP since
            % then only a fanbeam algorithm need be implemented.
            if strcmpi(config.ray_geometry, 'parallel')
                config.source_object_distance = inf;
                config.object_detector_distance = 100000;
            end
            
            this.ray_geometry           = config.ray_geometry;
			this.detector_size          = config.detector_size;
			this.detector_element_size  = config.detector_element_size;
			this.projection_angles      = config.projection_angles;
            
            this.source_object_distance   = config.source_object_distance;
            this.object_detector_distance = config.object_detector_distance;
        end
        
        function dim = get.dimensionality(this)
            % Returns the dimensionality of the object that the projection
            % geometry can project. A 1D detector is the radon transform of
            % a 2D object.
            if ~isempty(this.detector_size)
                dim = numel(this.detector_size) +1;
            else
                dim = 0;
            end
        end
        
        function mag = get.magnification(this)
            switch this.ray_geometry
                case 'parallel'
                    mag = 1;
                case 'fanbeam'
                    mag = 1 + this.object_detector_distance/this.source_object_distance;
            end
        end
        
        function size = get.sinogram_size(this)
            % Returns the size of a sinogram that would be generated using
            % this projector
            size = [numel(this.projection_angles) this.detector_size];
        end
        
        function bool = validate(this)
            bool = true;
        end
    end
end

