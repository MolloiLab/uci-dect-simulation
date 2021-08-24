classdef Phantom_Base < handle
%PHANTOMBASE Abstract base class for phantom objects
%  
% A phantom is a digital representation of a physical object that we can
% simulate.

% % % The abstract interface for Phantom objects
    properties (Abstract)
        dimensionality % dimensionality of the underlying phantom
        image_size % size in pixels of the generated attenuation maps
        element_size % the physical size of the elements in the attenuation map
        physical_size % the physical size of the attenuation map = image_size .* element_size
    end
    
    methods (Abstract)
        % Generates a linear attenuation coefficient image map at the given
        % energies. The last dimension of the attenuation_map array is
        % expected to correspond to the different energies.
        attenuation_map = generateAttenuationMap(this, energies)
        
        % Create and display a representation of the phantom
        show(this, energy)
        
        % Ensures that the phantom object has all the information it needs
        % to produce attenuation maps. Should return a boolean value
        % indicating if it is valid or not. Should display warnings for any
        % parameters that still require user input.
        bool = validate(this)
    end % methods (Abstract)

% % % The non-abstract properties for a Phantom
    properties (Dependent)
        VolumeGeometry % returns a VolumeGeometry object corresponding to the phantom
    end
        
% % % Simple method to generate a VolumeGeometry object
    methods
        function volume_geometry = get.VolumeGeometry(this)
            % Create and return a VolumeGeometry object
            if ~this.validate()
                ME = MException([mfilename ':NotValid'],...
                        'This object is not valid. Refer to warnings above.');
                ME.throw();
            end

            volume_geometry = VolumeGeometry(this.element_size, this.image_size);
        end
    end
    
end % classdef