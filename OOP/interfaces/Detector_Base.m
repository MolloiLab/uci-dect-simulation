classdef Detector_Base < handle
%DETECTOR_BASE Abstract base class for a Detector object
%
% In this system, a dector is essentially a filter that is applied to the
% ideal ut sinograms outputted by the forward projector and converts them
% into a single "real" sinogram to be passed on to the back projector.

    properties
        ProjectionGeometry
    end
    
    methods (Abstract)
        % Filters an array of ideal sinograms to produce output sinograms
        % suitable to pass to the back projector
        new_sinogram = filterSinogramArray(this, XRaySource, sinogram_array)
        
        bool = validate(this)
    end % methods (Abstract)
end % classdef