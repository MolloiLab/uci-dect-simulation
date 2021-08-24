classdef Phantom_MaterialProjectable < handle
%PHANTOM_MATERIALPROJECTABLE A trait for material projectable phantoms.
%
% This means that the phantom can be fully described by a set of material
% masks and their attenuation coefficients. We can use this trait to
% accelerate the computation of sinograms at different energies by
% computing material thickness sinograms once and simply using a linear
% combination to combine them. Instead of computing a sinogram for each
% energy, we just compute a sinogram for each material.
%
% See the MaterialForwardProjectorAdapter class for how this trait can be
% used.

    properties
    end
    
    methods (Abstract)
        % Returns the number of materials that are used to describe the
        % phantom
        num = numMaterials(this)
        
        % Computes mask images of all the materials in the Phantom.
        % Ordering of the materials must match the attenuations returned by
        % materialAttenuations.
        masks = materialMasks(this)
        
        % Gives the linear attenuation coefficients for all materials in
        % the phantom at the given energy. The ordering is expected to
        % match the order of the material masks.
        attenuations = materialAttenuations(this, energies)
    end
    
end
