% % Basic Object Descriptions
% 
% Phantom -- a representation of a physical object that we will project
% rays through in the simulation. 
% Properties: 
%       volume_geometry = (pixel_size, pixel_counts)
% Methods: 
%       generateAttenuationImage(energy)
%       show(energy)
% 
% ForwardProjector -- encapsulation and abstraction of the underlying
% projection method.
% Properties:
%       method
%       phantom_geometry
%       projection_geometry
% Methods:
%       setPhantom?
%       setPhantomGeometry(phantom.volume_geometry)
%       setProjectionGeometry(projection_geometry)
%       projectPhantom(phantom, energies)
% 
% X Ray Source -- encapsulates the generation of the x ray spectrum
% including the filtering.
% Properties:
%       kVpeak
%       exposure or mAs?
%       filter_list (has the material and thickness)
% Methods:
%       generateSpectrum()
%       getEnergies() - returns only energies with non-zero counts
% 
% BackProjector -- encapsulation and abstraction of the back projection
% method
% Properties:
%       method
%       projection_geometry
%       phantom?
% Methods:
%       reconstruct(sinogram)
% 
% 
% Geometry Structures -- use structs to describe the physical geometries in
% the simulation.
%   volume_geometry -- number of pixels and pixel size
%   projection geometry -- beam type, detector pixel size and count,
%       projection angles, SOD and ODD if fanbeam or conebeam

%% Simplest interface
% The simplest use of the package with pre-built components and sensible
% defaults for everything else.

phantom = LoadPhantom('my_phantom');
% returns a struct with the necessary geometry information to construct the
% forward projector
image_geom = phantom.getGeometry();

xray_source = GenerateSpectrum(energy, exposure);
detector    = LoadDetector('simple_charge_integrating');

projection_geometry = SimpleProjectionGeometry('fan');
forward_projector   = SimpleForwardProjector(image_geom, projection_geometry);
recon_geom          = GenerateSimpleReconGeometry(); %??? Depends on image_geom and projector (essentially just fanORparallel)

back_projector = SimpleBackProjector(recon_geom, projection_geometry);

% Now run the operations of the simulation
sinogram_array = forward_projector.GenerateSinogramArray(source, phantom);

detected_sinogram = detector.ComputeDetectedSinogram(sinogram_array);

reconstruction = back_projector.ReconstructSinogram(sinogram_array);

% Sensible defaults for the detector size and recon geometry should be such
% that none of the rays through the phantom miss the detector and that the
% reconstructed image is 512x512 with an extent to contain the complete
% reconstruction.
% It is also sensible to define the forward and backward projection methods
% to basic ray tracing and FBP respectively (automatically determining
% whether or not it is possible to use the GPU). The reconstruction angles
% can also be set to something sensible (like 1 : 360 degrees)

%% More complex usage
% I think phantoms should always be pre-built objects or simple
% modifications of them. Creating a new phantom on the fly would be a bit
% involved (though potentially useful for prototyping)
%
% Can use the "factory" design to construct more complex projectors, or
% (probably easier) use a struct to define it.