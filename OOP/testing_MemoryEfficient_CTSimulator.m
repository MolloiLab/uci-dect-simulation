% The largest memory hog in this CT simulation system is the sinogram_array
% which has num_detector_pixels * num_projection_angles * num_energies
% elements. This is alright for 2D projections of small phantoms, but is
% not manageable for larger (eg. 3D) phantoms.
%
% This version attempts to be more memory efficient by not creating a large
% sinogram_array from the ForwardProjector. Instead, an incrementable
% detector is employed so that the sinogram for each energy can be computed
% separately and passed to the detector for incremental filtering.

%% Clean up everything
clear
astra_clear

%% Load a prebuilt phantom object

% Simple 3D face phantom
Phantom = load('face3D');
F = fieldnames(Phantom);
Phantom = Phantom.(F{1});
% Phantom.element_size = [0.25 0.25 0.25];

clear F

% % Create a phantom on the fly from an image
% % Large breast phantom
% Phantom = IndexedImagePhantom();
% Phantom.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantoms\14cm-breast_100um-pixel.tif');
% Phantom.indexed_values = [255, 400, 800];
% Phantom.material_list = {'Hammerstein Adipose', 'Hammerstein Glandular', 'Ca'};
% % The small increase in element_size is needed to work around a strange bug
% % in ASTRA that I've only seen for this image...
% Phantom.element_size = [0.010000001, 0.010000001];


%% Define the x-ray source
kVp = 100;
exposure = 1000;

XRS = XRaySource(kVp, exposure);
XRS.addFilter('Al', 0.05);

XRS.mask_values = [40];

clear kVp exposure

%% Define the geometry of the system

cfg.detector_element_width       = 2;
cfg.reconstruction_element_width = 1;
cfg.projection_type              = 'parallel';
cfg.source_object_distance       = 800;
cfg.object_detector_distance     = 800;
cfg.projection_angles            = (1:4:360) .* pi/180;

Geoms = SimpleGeometries(Phantom, cfg);

Geoms.ReconGeometry.volume_size = 2 * Geoms.ReconGeometry.volume_size;

%% Create a ForwardProjector

FP_impl = MakeAstraForwardProjector(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
FP_impl.super_sampling_factor = 2;
% useGPU only exists for 2D algorithms
if FP_impl.dimensionality == 2
    FP_impl.useGPU = true;
end

% Wrap this projector implementation into a material forward projector to
% make the simulation more computationaly efficient when the number of
% energies being simulated is greater than the number of materials in the
% phantom
FP = MaterialForwardProjectorAdapter(FP_impl);

%% Create a detector

Detector = ChargeIntegratingDetector(Geoms.ProjectionGeometry);

% Ensure that this is an Incrementable detector
if ~isa(Detector, 'Detector_Incrementable')
    error('An Incrementable detector is required.');
end

%% Create a back projector

BP = MakeAstraFilteredBackProjector(Geoms.ProjectionGeometry, Geoms.ReconGeometry);
% useGPU only exists for 2D algorithms
if BP.dimensionality == 2
    BP.useGPU = false;
end

%% Connect the components together and run the simulation

% Phantom.show(40);

% Run the forward projection one energy at a time and add it to the current
% detector. Doing this uses numel(energies) times less memory than the
% sinogram_array implementation
tic
% Ensure that the current sinogram is initially empty
Detector.clearSummedSinogram();
for eng_idx = 1 : numel(XRS.energies)
    Io = XRS.spectrum(eng_idx);
    energy = XRS.energies(eng_idx);
    sinogram = FP.generateSinograms(Phantom, energy);
    
    Detector.addSinogram(Io, energy, sinogram);
end

real_sinogram = Detector.computeResultingSinogram(XRS);
toc
if FP.dimensionality == 2
    imtool3D(real_sinogram);
else % dimensionality == 3
    DisplayProjectionsFromSinogram(real_sinogram);
end
set(gcf, 'name', 'Detected Sinogram')

%% Reconstruct with the back projector
tic
% a large mutliplicative factor is required for the GPU backprojection... I
% have no idea where the value comes from but this is what makes the final
% values correct on average.
if BP.dimensionality == 2 && BP.useGPU
    Recon = BP.reconstruct(real_sinogram);
else
    Recon = BP.reconstruct(real_sinogram);
end
toc
imtool3D(Recon);
set(gcf, 'name', 'Reconstructed Image')

mean(Recon(:))