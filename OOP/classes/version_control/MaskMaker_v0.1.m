classdef MaskMaker < handle
    %MASKMAKER Creates image masks representing geometric objects
    %
    % Uses a coordinate system with the origin at the center of the volume
    properties (SetAccess = private)
        dimensionality
        grid_size
        grid_spacing
    end
    
    properties (SetAccess = private)
        internal_mask
        internal_coords
    end
    
    methods
        function this = MaskMaker(grid_size, grid_spacing)
            % Constructor for a MaskMaker
            %   MM = MaskMaker(grid_size, grid_spacing);
            % grid_size is the pixel count of each dimension of the volume
            % grid_spacing is the physical spacing of each pixel
            %
            % The current implementation only supports the creation of 3D
            % masks, though generalizing to 2D should be pretty
            % straightforward.
            this.dimensionality = numel(grid_size);
            if this.dimensionality ~= 3
                error([mfilename, ':Only3D',...
                        'Only 3D grids are supported at this time.']);
            end
            % using (:) and transpose ' ensures creates a row vector
            this.grid_size = grid_size(:)';
            
            if nargin == 2
                if numel(grid_spacing) ~= numel(grid_size)
                    error([mfilename, ':DimensionMismatch',...
                        'Dimension mismatch between the grid size and the grid spacing.']);
                end
                % using (:) and transpose ' ensures creates a row vector
                this.grid_spacing = grid_spacing(:)';
            else
                this.grid_spacing = ones(size(grid_size(:)'));
            end
            
            % Call the initialization functions
            this.clearMask();
            this.initializeCoordinateSystem();
        end
        
        function mask = makeSphere(this, S)
            % Creates a mask of a sphere defined by the input parameters
            % from the struct S: 
            %     S.center 
            %     S.radius
            if ~isstruct(S)
                error([mfilename, ':makeCircle',...
                        'A configuration struct is required as input.']);
            end
            
            this.clearMask();
            % parse the input struct and assign defaults
            struct_fields  = {'center', 'radius'};
            % default radius is 40% of the shortest grid length
            default_radius = 0.4* min(this.grid_size.*this.grid_spacing);
            default_values = {[0,0,0], default_radius};
            
            for idx = 1 : numel(struct_fields)
                % uncell to extract the string
                field_name = struct_fields{idx};
                if ~isfield(S, field_name)
                    S.(field_name) = default_values{idx};
                end
            end
            
            coords = this.internal_coords;
            coords = bsxfun(@minus, coords, S.center);

            Xp = coords(:,1);
            Yp = coords(:,2);
            Zp = coords(:,3);
            % Use the defining equation of the object to check which points fall on the
            % interior and then assign those points a value
            inds = Xp.^2 + Yp.^2 + Zp.^2 < (S.radius)^2;

            this.internal_mask(inds) = true;
            mask = this.internal_mask;
        end
        
        function mask = makeEllipse(this, S)
            % Creates a mask of a sphere defined by the input parameters
            % from the struct S: 
            %     S.center
            %     S.phi
            %     S.theta
            %     S.psi
            %     S.semiX
            %     S.semiY
            %     S.semiZ
            %
            % For the Euler angles used, I follow the x-axis convention.
            % See http://mathworld.wolfram.com/EulerAngles.html for more
            % information on the transformation
            if ~isstruct(S)
                error([mfilename, ':makeEllipse',...
                        'A configuration struct is required as input.']);
            end
            
            this.clearMask();
            % parse the input struct and assign defaults
            struct_fields  = {'center', 'phi', 'theta', 'psi', 'semiX', 'semiY', 'semiZ'};
            % default semi-axis is 40% of the respective grid_length
            default_semis = 0.4.* this.grid_size.*this.grid_spacing;
            default_values = {[0,0,0], 0, 0, 0, default_semis(1), default_semis(2), default_semis(3)};
            
            for idx = 1 : numel(struct_fields)
                % uncell to extract the string
                field_name = struct_fields{idx};
                if ~isfield(S, field_name)
                    S.(field_name) = default_values{idx};
                end
            end
            
            coords = this.internal_coords;
            coords = bsxfun(@minus, coords, S.center);
            
            % apply the inverse of the rotation matrix
            inv_rot = this.inverseEulerRotationMatrix(S.phi, S.theta, S.psi);
            coords = (inv_rot * (coords'))';

            Xp = coords(:,1);
            Yp = coords(:,2);
            Zp = coords(:,3);
            % Use the defining equation of the object to check which points
            % fall on the interior
            % See http://mathworld.wolfram.com/Ellipsoid.html
            LHS = (Xp.^2)./(S.semiX^2) + (Yp.^2)./(S.semiY^2) + (Zp.^2)./(S.semiZ^2);
            inds = LHS < 1;

            this.internal_mask(inds) = true;
            mask = this.internal_mask;
        end
    end
    
    methods (Access = private)
        function clearMask(this)
            this.internal_mask = false(this.grid_size);
        end
        
        function initializeCoordinateSystem(this)
            % Creates the initial coordinate system of the array. This
            % function establishes coordinates for each pixel in a coord
            % system where the center of the image volume is defined as the
            % origin
            
            % local aliases
            g_size = this.grid_size;
            g_spacing = this.grid_spacing;
            % create initial grid coordinates with the center of the first
            % pixel as the origin
            Xgv = (0 : (g_size(1)-1) ) .* g_spacing(1);
            Ygv = (0 : (g_size(2)-1) ) .* g_spacing(2);
            Zgv = (0 : (g_size(3)-1) ) .* g_spacing(3);
            
            [X, Y, Z] = meshgrid(Xgv, Ygv, Zgv);
            % turn them into a matrix of points (one point per row)
            grid_coords = [X(:), Y(:), Z(:)];
            % compute the displacement of one coordinate to the center of
            % the grid
            dist = 0.5*g_spacing .*(g_size - 1);
            % shift the grid points
            this.internal_coords = bsxfun(@minus, grid_coords, dist);
        end
        
    end
    
    methods (Static)
        function Inverse = inverseEulerRotationMatrix(phi, theta, psi)
            % Constructs the inverse Euler rotation transformation
            
            % Since I'm lazy, I just construct the forward transform matrix
            % and then take its inverse. This also makes it pretty clear
            % what the rotation order is.
            % Following the convention/notation (zxz) from:
            % http://mathworld.wolfram.com/EulerAngles.html
            D = [ cos(phi) -sin(phi) 0
                  sin(phi)  cos(phi) 0
                     0         0     1];

            C = [ 1      0           0
                  0  cos(theta) -sin(theta)
                  0  sin(theta)  cos(theta)];

            B = [ cos(psi) -sin(psi) 0
                  sin(psi)  cos(psi) 0
                     0         0     1];
                 
            Forward = B*C*D;
            Inverse = inv(Forward);
        end
    end
end

