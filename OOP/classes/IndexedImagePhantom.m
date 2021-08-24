classdef IndexedImagePhantom < Phantom_Base...
                             & Phantom_MaterialProjectable
%INDEXEDIMAGEPHANTOM A phantom represented by an index image
%
% 

% NOTES:
%   It is possible to assign multiple indexes to the same material by
%   duplicating the entery in the material_list array. However,
%   this redundancy is not checked for so the computational cost is the
%   same as if they are different materials. A better method is to modify
%   the indexed_image so that all pixels of the same material have a single
%   value. This operation must be done outside of this object.


    properties
        element_size
        vessel_mask
        vessel_material
        vessel_idx
        indexed_image
        indexed_values
        
        material_list = {};
        
    end
    
    properties (Dependent)
        dimensionality
        image_size
        physical_size
    end
    
    properties %(Access = protected)
        material_attenuation_vectors
        is_valid
    end
        
    methods
        function this = IndexedImagePhantom(varargin)
            % IndexedImagePhantom constructor
            switch nargin
                case 0
                    % create a default empty object
                    this.is_valid = 0;
                case 1
                otherwise
                    ME = MException([mfilename ':input'],...
                        'Constructor with that type signature not supported.');
                    ME.throw();
            end
        end
        
% % % % % Getters and setters for dependent properties
        function dimensionality = get.dimensionality(this)
            dimensionality = ndims(this.indexed_image);
        end
        
        function image_size = get.image_size(this)
            image_size = size(this.indexed_image);
        end
        
        function physical_size = get.physical_size(this)
            physical_size = this.image_size .* this.element_size;
        end
        
        function set.physical_size(this, new_physical_size)
            new_element_size = new_physical_size ./ this.image_size;
            this.element_size = new_element_size;
        end

% % % % % Getters and setters for abstract properties of PhantomBase
        function set.indexed_image(this, new_indexed_image)
            this.indexed_image = new_indexed_image;
            this.has_changed();
        end
        
        function set.indexed_values(this, new_indexed_values)
            this.indexed_values = new_indexed_values;
            this.has_changed();
        end
        
        function set.material_list(this, new_material_list)
            if ~iscell(new_material_list)
                ME = MException([mfilename ':SetMaterialList'],...
                        'material_list must be a cell array of material names.');
                ME.throw();
            end
            this.material_list = new_material_list;
            this.has_changed();
        end


% % % % % Implementations of abstract methods from PhantomBase
        function attenuation_map = generateAttenuationMap( this, energies)
            % Converts the phantom descrpition into an attenuation map
            %      generateAttenuationMap( this, energies)
            
            % Check if the object is valid
            if ~this.validate()
                ME = MException([mfilename ':NotValid'],...
                        'This object is not valid. Refer to warnings above.');
                ME.throw();
            end
            % check if the energies are in the right range and throw an
            % error if they are not
            if max(energies) > 200 || min(energies) < 1
                ME = MException([mfilename ':BadEnergies'],...
                        'Energies must be in the range 1 - 200keV.');
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
        
% % % % % Implementations of abstract methods from Phantom_MaterialProjectable
        function num = numMaterials(this)
            % Returns the number of materials composing the phantom
            num = numel(this.material_list);
        end

        function masks = materialMasks(this)
            % Computes mask images of all the materials in the Phantom. The
            % order is expected to match the order attenuation vectors
            % outputted from materialAttenuations.
            
            num_materials = numel(this.material_list);
            masks = zeros([this.image_size, num_materials]);
            % some magic to make the same code work for any size image by
            % using subsasgn directly in the assignment to avoid code
            % assuming a specific dimensionality
            S.type = '()';
            S.subs = cell(1, 1+numel(this.image_size));
            S.subs(:) = {':'};
            for idx = 1 : num_materials
                S.subs{end} = idx;
                mask = (this.indexed_image == this.indexed_values(idx));
                masks = subsasgn(masks, S, mask);
            end
        end
        
        function attenuations = materialAttenuations(this, energy)
            % Gives the linear attenuation coefficients for all materials
            % in the phantom at the given energy. The order is expected to
            % match the order of the masks outputted from materialMasks
            
            
            attenuations = cellfun(@(X) X(energy), this.material_attenuation_vectors);
        end
    end
    
    methods
        
        function computeAttenuationVectors(this)
            % Computes and store attenuation values for all materials in
            % the phantom
            this.material_attenuation_vectors = cell(numel(this.material_list),1);
            for idx = 1 : numel(this.material_list)
                % get the string for the material
                material = this.material_list{idx};
                % compute the linear attenuation coefficient for that
                % material using crosssect
                this.material_attenuation_vectors{idx} =...
                    crosssect( material, (1:200)','linear');
            end
        end
        
        function has_changed(this)
            % Called when some property of the object has been modified so
            % that the validate() routine can be called again before
            % computing any results
            this.is_valid = false;
        end
                
        function bool = validate(this)
            % Checks if the phantom object has enough information to be
            % used and reurn warning messages if anything seems amiss. Also
            % does the task of computing dependent parameters necessary for
            % later calculations.
            
%             % Setting override to true will cause the validation to run
%             % despite there being a cached value indicating that it is
%             % valid.
%             if nargin < 2
%                 override = false;
%             end

			% Quick exit if the object has already been validated
			if this.is_valid %&& ~override
				bool = true;
				return
			end
			
            % default to true and check values to make it false if
            % necessary
            bool = true;
            if isempty(this.element_size)
               warning([mfilename ':validate:element_size'], 'element_size is not defined.');
               bool = false;
            end
            if isempty(this.indexed_image)
               warning([mfilename ':validate:indexed_image'], 'indexed_image is not defined.');
               bool = false;
            end
            if isempty(this.indexed_values)
               warning([mfilename ':validate:indexed_values'], 'indexed_values is not defined.');
               bool = false;
            end
            if isempty(this.material_list)
               warning([mfilename ':validate:material_list'], 'material_list is not defined.');
               bool = false;
            end
			
            % TODO: Check if the indexed_values match pixels in index_image
            % TODO: Check that the materials in material_list are valid
            
            if bool
                this.is_valid = true;
				% compute the attenuation vectors
				this.computeAttenuationVectors();
            end
        end
    end
    
end % classdef