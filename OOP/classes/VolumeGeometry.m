classdef VolumeGeometry
%VOLUMEGEOMETRY Simple class to describe a physical region of space
%   For use in the simulation package to contain all information
%   corresponding to the imaging or reconstruction geometries including:
%       volume_size -- in units of pixels
%       physical_size --  in physical units
%   Both properties are stored in vectors for the x,y,z,... dimensions
    
    properties
        % the number of elements in each dimension of the volume
        volume_size
        % the size of a single element of the volume in physical units
        element_size
    end
    
    properties (Dependent)
        % the number of dimensions of the volume
        dimensionality
        % the size of each dimension of the volume in physical units
        physical_size
    end
    
    methods
        function this = VolumeGeometry(element_size, volume_size)
            % VolumeGeometry constructor
            %
            % this = VolumeGeometry(pixel_size, element_size)
            
            % allow for the creation of an empty object
            if nargin == 0
                return
            end
            if numel(volume_size) ~= numel(element_size)
                ME = MException([mfilename, ':DimMismatch'],...
                        'Inputs must have the same dimensionality.');
                ME.throw();
            end
            % Currently, only isotropic voxels are supported...
            if ~all(element_size == element_size(1))
                ME = MException([mfilename, ':OnlyIsotropic'],...
                        'Only isotropic element sizes are currently supported.');
                ME.throw();
            end
            
            this.volume_size = volume_size(:);
            this.element_size = element_size(:);
        end
        
        function ps = get.physical_size(this)
            % Computes the physical size of the volume
            ps = this.volume_size .* this.element_size;
        end
        
        function dim = get.dimensionality(this)
            % The dimensionality of the volume
            dim = numel(this.volume_size);
        end
    end
end

