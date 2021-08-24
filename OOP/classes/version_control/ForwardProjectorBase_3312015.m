classdef ForwardProjectorBase < handle
%FORWARDPROJECTORBASE Pure abstract base class for forward projectors
%
%
    
% A forward projector is responsible for generating a mu*t ideal sinogram
% from a phantom object. This requires information about the projection
% geometry, which must correspond to the detector object that the
% projections are projected onto.
% Essential properties of a phantom:
%   the physical extent of the phantom in space
%   the geometry of the space that it occupies in general
% Essential methods of a phantom:
%   generate image representation dependent on the energy

    properties (Abstract)
        dimensionality % dimensionality of the projection geometry
        VolumeGeometry % geometry of the input volume
        ProjectionGeometry % geometry of the projections
        sinogram_size % size in pixels of the generated sinograms
    end
        
    methods (Abstract)
        sinograms = generateSinograms(this, energy)
        isValid = validate(this)
    end % methods (Abstract)
    
end % classdef