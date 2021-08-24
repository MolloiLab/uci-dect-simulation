classdef MaterialForwardProjectorAdapter < ForwardProjector_Base
%MATERIALFORWARDPROJECTORADAPTER Adapter to make a ForwardProjector material-projectable smart.
%   Encapsulates the interaction between a ArrayProjectable
%   ForwardProjector and a MaterialProjectable Phantom. Adapts the
%   ForwardProjector to efficiently operate with the Phantom and to cahche
%   the result if the same phantom is projected repeatedly.
    
    properties
        % Holds a reference to the ForwardProjector that it adapts
        ForwardProjector
        
        material_thickness_sinograms
    end
    
%     % % % Overriden properties of the ForwardProjector_Base class
%     % These are just pass-throughs to the adatped ForwardProjector
%     properties (Dependent)
%         % geometry of the input volume
%         VolumeGeometry
%         % geometry of the projections
%         ProjectionGeometry
%     end
    
    methods
    %{
        function this = MaterialForwardProjectorAdapter(varargin)
            if nargin ~= 2
                error([mfilename, ':CtorInputs'],...
                        'Two inputs are required: an ArrayProjectable ForwardProjector and a MaterialProjectable Phantom.');
            end
            
            % Parse the inputs to find the Phantom and ForwardProjector
            % objects. This makes is so that the order does not matter.
            FP_idx  = cellfun(@(x) isa(x, 'ForwardProjector_ArrayProjectable'), varargin);
            P_idx   = cellfun(@(x) isa(x, 'Phantom_MaterialProjectable'), varargin);
            
            if ~any(FP_idx)
                error([mfilename, ':NotArrayProjectable'],...
                        'This ForwardProjector Adapter requires an ArrayProjectable ForwardProjector.');
            end
            
            if ~any(P_idx)
                error([mfilename, ':NotMaterialProjectable'],...
                        'This ForwardProjector Adapter requires a MaterialProjectable Phantom.');
            end
            
            MTS = computeMaterialThicknessSinograms(varargin{P_idx}, varargin{FP_idx});
            
            this.material_thickness_sinograms = MTS;
            this.material_attenuations = Phantom.materialAttenuations();
        end
    %}
        function this = MaterialForwardProjectorAdapter(FP)
            % The only ctor which requires a ForwardProjector as input.
            %  The passed in FP will be the one used to generate the
            %  material thickness sinograms.
            
            if nargin ~= 1
                error([mfilename, ':CtorInputs'],...
                        'A single ForwardProjector is required as input.');
            end
            % Check to make sure the forward projector is array projectable
            if ~isa(FP, 'ForwardProjector_ArrayProjectable')
                error([mfilename, ':NotArrayProjectable'],...
                        'This ForwardProjector Adapter requires an ArrayProjectable ForwardProjector.');
            end
            
            this.ForwardProjector = FP;
            % Also need to assign values to the properties of the
            % ForwardProjector_Base 
            
            % TODO: In the current implementation, these geometries can
            % become out of sync with the adapted FP since its geometries
            % are stored independently. To get around this, the geometries
            % are reassigned in each call to generateSinograms.
            this.VolumeGeometry = FP.VolumeGeometry;
            this.ProjectionGeometry = FP.ProjectionGeometry;
            this.validate();
        end
        
% % % % % % % Override the abstract interface of a ForwardProjector
        function sinograms = generateSinograms(this, Phantom, energies)
            
            % Make sure this object is valid
            if ~this.validate()
                error([mfilename, ':Invalid'],...
                        'This ForwardProjector is invalide. See warnings above.');
            end
            
            % Make sure that the phantom satisfies the ArrayProjectable
            % interface
            if ~isa(Phantom, 'Phantom_MaterialProjectable')
                error([mfilename, ':NotMaterialProjectable'],...
                        'This ForwardProjector Adapter requires a MaterialProjectable Phantom.');
            end
            
            % Ensure that the geometries are up to date (see above TODO)
            this.VolumeGeometry = this.ForwardProjector.VolumeGeometry;
            this.ProjectionGeometry = this.ForwardProjector.ProjectionGeometry;
            
            % Compute the material thickness sinograms
            if isempty(this.material_thickness_sinograms)
                MTS = this.computeMaterialThicknessSinograms(Phantom);
                this.material_thickness_sinograms = MTS;
            else
                MTS = this.material_thickness_sinograms;
            end
            % some magic to make the same code work for both 2D and 3D
            % sinograms using subsasgn directly in the assignment to avoid
            % code assuming a specific dimensionality
            S.type = '()';
            S.subs = cell(1, this.dimensionality+1);
            S.subs(:) = {':'};
            
            % Each material sinogram is to be multipled by the attenuation
            % value of that material. The following code does this without
            % needing a loop over the materials or over the dimensionality
            % of the phantom.
            % Deal with the special case of a phantom with a single
            % material
            if Phantom.numMaterials == 1
                mat_dim = ndims(MTS)+1;
            else
                mat_dim = ndims(MTS);
            end
            %   Note the transpose since circshift operates on columns
            permuter = circshift((1 : mat_dim)', -1);    
            
            % allocate memory
            sinograms = zeros([this.sinogram_size, numel(energies)]);
            % loop over the energies to compute sinograms
            for energy_idx = 1 : numel(energies)
                energy = energies(energy_idx);
                S.subs{end} = energy_idx;
                
                attenuation_values = Phantom.materialAttenuations(energy);
                attenuation_values = permute(attenuation_values, permuter);
                % perform the multiplication mu * t
                sino = bsxfun(@times, attenuation_values, MTS);
                % Add the individual material ut's together to get the
                % final count sinogram for this energy
                sino = sum(sino, mat_dim);
                
                sinograms = subsasgn(sinograms, S, sino);
            end
        end
        
        % Pass through of the validate function to the adapted FP
        function bool = validate(this)
            bool = this.ForwardProjector.validate();
            this.is_valid = bool;
        end

% % % % % Simple getters and setters passed through to the underlying FP
%         function PG = get.ProjectionGeometry(this)
%             PG = this.ForwardProjector.ProjectionGeometry;
%         end
%         
%         function VG = get.VolumeGeometry(this)
%             VG = this.ForwardProjector.VolumeGeometry;
%         end
%         
%         function set.ProjectionGeometry(this, PG)
%             this.ForwardProjector.ProjectionGeometry = PG;
%         end
%         
%         function set.VolumeGeometry(this, VG)
%             this.ForwardProjector.VolumeGeometry = VG;
%         end
    end
    
    methods %(Access = private)
        % This is where the actual projection occurs to create the
        % individual material sinograms
        function MTS = computeMaterialThicknessSinograms(this, Phantom)
            % Get an array of material masks from the Phantom
            material_masks = Phantom.materialMasks();
            num_materials  = Phantom.numMaterials();
            
            % some magic to make the same code work for both 2D and 3D
            % sinograms using subsasgn directly in the assignment to avoid
            % code assuming a specific dimensionality
            S.type = '()';
            S.subs = cell(1, this.ForwardProjector.dimensionality+1);
            S.subs(:) = {':'};
            
            % allocate memory for the material thickness sinograms, which
            % are an array of sinograms (one for each material)
            MTS = zeros([this.ForwardProjector.sinogram_size, num_materials], 'single');
            % loop over the different materials
            for mat_idx = 1 : num_materials
                S.subs{end} = mat_idx;
                % get the material mask
                mat_mask = subsref(material_masks, S);
                % compute the sinogram from that map
                sino = this.ForwardProjector.projectImage(mat_mask);
                % save the result in the MTS array
                % MTS(:,...,:, mat_idx) = sino;
                MTS = subsasgn(MTS, S, sino);
            end
        end
    end
    
end

