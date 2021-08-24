classdef BackProjector_Base < handle
%BACKPROJECTORBASE Abstract base class for back projectors
%   
% A back projector is responsible for reconstructing an image from a
% sinogram and geometry information.

% % % The abstract interface for a ForwardProjector
    methods (Abstract)
        % the core BP function that reconstructs from a sinogram
        volume = reconstruct(this, sinogram)
        
        % validates the object to see if it is ready for action
        validate(this)
    end % methods (Abstract)

    
% % % Non-abstract properties --  Geometries to describe the projections
    properties
        % describes the geometry of the reconstructed image
        VolumeGeometry
        
        % describes the geometry of the projected sinogram
        ProjectionGeometry
        
        % indicates whether or not the object has been validated
        is_valid
    end
    
    properties (Dependent)
        % dimensionality of the projection geometry
        dimensionality
        
        % size in pixels of the required sinogram
        sinogram_size
    end
    
    methods
        function this = BackProjector_Base(varargin)
            % Base Constructor to handle input geometries
            proj_geom_idx  = cellfun(@(x) isa(x, 'ProjectionGeometry'), varargin);
            vol_geom_idx   = cellfun(@(x) isa(x, 'VolumeGeometry'), varargin);
            
            if any(proj_geom_idx)
                idx = find(proj_geom_idx, 1, 'first');
                this.ProjectionGeometry = varargin{idx};
            else
                this.ProjectionGeometry = ProjectionGeometry(); %#ok<CPROP>
            end
            
            if any(vol_geom_idx)
                idx = find(vol_geom_idx, 1, 'first');
                this.VolumeGeometry = varargin{idx};
            else
                this.VolumeGeometry = VolumeGeometry(); %#ok<CPROP>
            end
        end
        
% % % % % Simple getters and setters

        function dims = get.dimensionality(this)
            dims = this.VolumeGeometry.dimensionality;
        end
        
        function sino_size = get.sinogram_size(this)
            sino_size = [numel(this.ProjectionGeometry.projection_angles),...
                         this.ProjectionGeometry.detector_size(:)'];
        end
        
        function set.ProjectionGeometry(this, PG)
            if ~isa(PG, 'ProjectionGeometry')
                ME = MException([mfilename ':input'],...
                        'Input must be a ProjectionGeometry object.');
                ME.throw();
            end
            this.ProjectionGeometry = PG;
            this.is_valid = false;
        end
        
        function set.VolumeGeometry(this, VG)
            if ~isa(VG, 'VolumeGeometry')
                ME = MException([mfilename ':input'],...
                        'Input must be a VolumeGeometry object.');
                ME.throw();
            end
            this.VolumeGeometry = VG;
            this.is_valid = false;
        end
        
    end
end % classdef