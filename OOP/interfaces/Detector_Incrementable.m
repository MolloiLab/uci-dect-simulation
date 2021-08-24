classdef Detector_Incrementable < handle
%DETECTOR_INCREMENTABLE A trait for detectors that can compute real
%sinograms incrementally
%
%   Detailed explanation goes here
    
    properties
        summed_sinogram
    end
    
    methods (Abstract)
        % Adds another sinogram to the detector
        addSinogram(this, Io, energy, sinogram)
        
        % Computes the output sinogram from the current value of the
        % summed_sinogram. For example, it is expected that the conversion
        % from counts sinogram to mu*t sinogram will occur within this
        % function.
        computeResultingSinogram(this, XRaySource)
    end
    
    % It would be easy enough to include a concrete implementation of the
    % filterSinogramArray function of the Detector_Base, but repeated calls
    % to addSinogram would be significantly slower than a good
    % implementation that operates on a complete sinogram_array.
    
    methods
        function clearSummedSinogram(this)
            % Resets the current incremental sinogram
            this.summed_sinogram = [];
        end
    end
    
end

