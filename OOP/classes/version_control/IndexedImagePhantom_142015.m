classdef IndexedImagePhantom < PhantomBase
%INDEXEDIMAGEPHANTOM A phantom represented by an index image
%
% 
    
    properties
        element_size
        
        indexed_image
        indexed_values
        
        material_list = {}
    end
    
    properties (Dependent)
        dimensionality
        image_size
        physical_size
        VolumeGeometry
    end
    
    properties %(Access = protected)
        material_attenuation_vectors
    end
        
    methods
        function this = IndexedImagePhantom(varargin)
            % IndexedImagePhantom constructor
            switch nargin
                case 0
                    % create a default empty object
                case 1
                otherwise
                    ME = MException([mfilename ':input'],...
                        'Constructor with that type signature not supported.');
                    ME.throw();
            end
        end
        
% % % % % Simple getters and setters
        function dimensionality = get.dimensionality(this)
            dimensionality = ndims(this.indexed_image);
        end
        
        function image_size = get.image_size(this)
            image_size = size(this.indexed_image);
        end
        
        function physical_size = get.physical_size(this)
            physical_size = this.image_size .* this.element_size;
        end
        
        function volume_geometry = get.VolumeGeometry(this)
            % Create and return a VolumeGeometry object

            if ~this.validate
                ME = MException([mfilename ':NotValid'],...
                        'This object is missing necessary fields.');
                ME.throw();
            end

            pixel_count = size(this.indexed_image);
            volume_geometry = VolumeGeometry(this.element_size, pixel_count);
        end
        
% % % % % Implementations of abstract methods from PhantomBase
        function attenuation_map = generateAttenuationMap( this, energies)
            % Converts the phantom descrpition into an attenuation map
            %      generateAttenuationMap( this, energies)
            
            % check that the object has been properly initialized
            if ~this.validate
                
            end
            % check if the energies are in the right range and throw an
            % error if they are not
            if max(energies) > 200 || min(energies) < 1
                ME = MException([mfilename ':BadEnergies'],...
                        'Energies must be in the range of 1 - 200keV.');
                ME.throw();
            end
            % some magic to make the same code work for any size image by
            % using subsasgn directly in the assignment to avoid code
            % assuming a specific dimensionality
            S.type = '()';
            S.subs = cell(1, 1+numel(this.image_size));
            S.subs(:) = {':'};
            % loop through the energies and assign attenuation values
            attenuation_map = zeros([this.image_size, numel(energies)]);
            for eng_idx = 1 : numel(energies)
                energy = energies(eng_idx);
                % modify the subsasgn struct
                S.subs{end} = eng_idx;
                % produce an attenuation map at the specified energy
                map = zeros(this.image_size);
                for mat_idx = 1: numel(this.material_list)
                    material_mask =  (double(this.indexed_image) == this.indexed_values(mat_idx));
                    map(material_mask) = this.material_attenuation_vectors{mat_idx}(energy);
                end
                attenuation_map = subsasgn(attenuation_map, S, map);
            end
        end
        
        function show(this, energy)
            % Create and display a representation of the phantom at the
            % given energy.
            %   this.display(energy)
            
            % throw an exception if there is no image data yet
            if isempty(this.indexed_image)
                ME = MException([mfilename ':NotInitialized'],...
                        'Image data has not been assigned to the phantom.');
                ME.throw();
            end
            % if no energy is given, just display the indexed image
            if nargin == 1
                imtool3D(this.indexed_image);
                return
            end
            % create a representation of the phantom at the given energy
            image = this.generateAttenuationMap(energy);
            imtool3D(image);
        end
    end
    
    methods
        
        function computeAttenuationVectors(this)
            % Computes and store attenuation values for all materials in
            % the phantom
            this.material_attenuation_vectors = cell(3,1);
            for idx = 1 : numel(this.material_list)
                % get the string for the material
                material = this.material_list{idx};
                % compute the linear attenuation coefficient for that
                % material using crosssect
                this.material_attenuation_vectors{idx} =...
                    crosssect( material, (1:200)','linear');
            end
        end
                
        function bool = validate(this)
            % Checks if the phantom object has enough information to be
            % used and reurn warning messages if anything seems amiss. Also
            % does the task of computing dependent parameters necessary for
            % calculations.
            
            % default to true and check values to make it false if
            % necessary
            bool = true;
            if isempty(this.element_size)
               warning([mfilename ':element_size'], 'element_size is not defined.');
               bool = false;
            end
            if isempty(this.indexed_image)
               warning([mfilename ':indexed_image'], 'indexed_image is not defined.');
               bool = false;
            end
            if isempty(this.indexed_values)
               warning([mfilename ':indexed_values'], 'indexed_values is not defined.');
               bool = false;
            end
            if isempty(this.material_list)
               warning([mfilename ':material_list'], 'material_list is not defined.');
               bool = false;
            end
            % compute the attenuation vectors
            this.computeAttenuationVectors();
        end
    end
    
end % classdef