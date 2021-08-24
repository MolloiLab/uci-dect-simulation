%% Clean up everything
clear
astra_clear
close all
imtool close all

%% Load a prebuilt phantom object

% Basic 2D phantom constructed from ellipses
phantom_name = 'test_small.mat';

% Simple 3D face phantom
% phantom_name = 'face3D.mat';

phantom_name = 'calcified_vessels.mat';

Phantom = load(phantom_name);
F = fieldnames(Phantom);
Phantom = Phantom.(F{1});

clear F

%% Define the x-ray source
kVp = 60;
exposure = 10;

XRS = XRaySource(kVp, exposure);
XRS.addFilter('Al', 0.05);

clear kVp exposure

%% Define the geometry of the system

% element widths should be isotropic
cfg.detector_element_width       = 0.1;
cfg.reconstruction_element_width = 0.05;
% cfg.projection_angles = linspace(0, 2*pi, 180);

cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 400;
cfg.object_detector_distance     = 400;

Geoms = SimpleGeometries(Phantom, cfg);

%% Create a ForwardProjector

FP_impl = MakeAstraForwardProjector(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
if FP_impl.dimensionality == 2
    FP_impl.useGPU = true;
end

% Wrap this projector implementation into a material forward projector to
% make the simulation more efficient
FP = MaterialForwardProjectorAdapter(FP_impl);

%% Create a detector

Detector = ChargeIntegratingDetector(Geoms.ProjectionGeometry);
Detector.noise_type = 'Gaussian';
Detector.focal_spot_blur = .1;

%% Create a back projector

BP = MakeAstraFilteredBackProjector(Geoms.ProjectionGeometry, Geoms.ReconGeometry);
if BP.dimensionality == 2
    BP.useGPU = false;
end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% Connect the components together and run the simulation

% Perform the forward projection of the Phantom
sino_array = FP.generateSinograms(Phantom, XRS.energies);

% Filter the sinogram with the detector and the xray source
real_sinogram = Detector.filterSinogramArray(XRS, sino_array);

% Reconstruct with the back projector
Recon = BP.reconstruct(real_sinogram);

% Display the results
imtool3D(sino_array);
set(gcf, 'name', 'Sinogram Array')

imtool3D(real_sinogram);
set(gcf, 'name', 'Detected Sinogram')

imtool3D(Recon);
set(gcf, 'name', 'Reconstructed Image')