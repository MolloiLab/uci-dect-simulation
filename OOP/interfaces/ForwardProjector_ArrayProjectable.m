classdef ForwardProjector_ArrayProjectable < handle
%FORWARDPROJECTOR_ARRAYPROJECTABLE A trait for FPs that can project a pixelated image.
%
% This interface defines behavior for forward projectors that can generate
% a sinogram directly from an input image (an array) without any additional
% information. Most FPs should satisfy this interface. The interface also
% defines a default generateSinograms implementation for such FPs. To
% implement a new forward projector that inherits from this class, only the
% projectImage function needs to be defined (See AstraForwardProjector2D for
% an example of this).
    
    methods (Abstract)
        % projects a single image to produce a sinogram
        sino = projectImage(this, image)
    end
    
    methods
        function sinograms = generateSinograms(this, Phantom, energies)
            % Default implementation of the generateSinograms function.
            % Uses the projectImage function defined above in the
            % generation. Genereate sinograms from the referenced phantom
            % object. The energies input is a single or array of energies.
            % The return value is an array of sinograms in which the last
            % index varies the energy of the sinogram, corresponding to the
            % index of the energies array.
            
            if ~this.validate();
                error('Forward projector not ready to generate sinograms.');
            end
            
            % some magic to make the same code work for both 2D and 3D
            % sinograms using subsasgn directly in the assignment to avoid
            % code assuming a specific dimensionality
            S.type = '()';
            S.subs = cell(1, this.dimensionality+1);
            S.subs(:) = {':'};
            
            % allocate memory
            sinograms = zeros([this.sinogram_size, numel(energies)]);
            % loop over the different energies
            for energy_idx = 1 : numel(energies)
                energy = energies(energy_idx);
                S.subs{end} = energy_idx;
                % generate an attenuation map at the specified energy
                lmu_map = Phantom.generateAttenuationMap(energy);
                % compute the sinogram from that map
                sino = this.projectImage(lmu_map);
                % save the result
                sinograms = subsasgn(sinograms, S, sino);
%                 sinograms(:,:, energy_idx) = sino;
            end
        end
    end
    
end

