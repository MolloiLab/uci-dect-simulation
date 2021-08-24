classdef ForwardProjector_Base < handle
%FORWARDPROJECTORBASE Abstract base class for forward projectors
%
% A forward projector is responsible for generating a mu*t ideal sinogram
% from a phantom object.
    
% % % The abstract interface for a ForwardProjector
    methods (Abstract)
        % the core FP function that generates sinograms from a Phantom
        sinograms = generateSinograms(this, Phantom, energies)
        
        % validates the object to see if it is ready for action
        bool = validate(this)
    end
   
% % % Non-abstract properties --  Geometries to describe the projections
    properties
        % geometry of the input volume
        VolumeGeometry
        
        % geometry of the projections
        ProjectionGeometry
        
        % used to track changes in the object that require revalidation
        is_valid
    end
    
    properties (Dependent)
        % dimensionality of the projection geometry
        dimensionality
        
        % number of pixels in the generated sinograms
        sinogram_size
    end
    
    methods
        function this = ForwardProjector_Base(varargin)
            % Constructor to handle input geometries
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
end