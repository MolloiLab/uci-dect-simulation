%% Clean up everything
%EDITTED
clear
astra_clear
close all
imtool close all

%% Create a phantom object

phantom_name = 'calcified_vessels.mat';

% Extract the phantom from the .mat file, regardless of its internal name
Phantom = load(phantom_name);
F = fieldnames(Phantom);
Phantom = Phantom.(F{1});

% Phantom.material_list(end) = {'Striated Muscle'};

clear F

%% Define the 2 different x-ray sources
kVp = 135;
exposure = 10;

XRS_high = XRaySource(kVp, exposure);
XRS_high.addFilter('Al', 0.5);

kVp = 80;
exposure = 10;

XRS_low = XRaySource(kVp, exposure);
XRS_low.addFilter('Al', 0.5);

plot(XRS_low.energies, XRS_low.spectrum,...
     XRS_high.energies, XRS_high.spectrum)
title('DE Xray Spectra');

mean_energy_low  = sum(XRS_low.spectrum .* XRS_low.energies) ./ sum(XRS_low.spectrum);
mean_energy_high = sum(XRS_high.spectrum .* XRS_high.energies) ./ sum(XRS_high.spectrum);

clear kVp exposure

%% Define the geometry of the system

% element widths should be isotropic
cfg.detector_element_width       = 0.05;
cfg.reconstruction_element_width = 0.05;

cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 400;
cfg.object_detector_distance     = 400;

Geoms = SimpleGeometries(Phantom, cfg);

%% Create a ForwardProjector

FP_impl = MakeAstraForwardProjector(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
if FP_impl.dimensionality == 2
    FP_impl.useGPU = false;
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

%% Low energy simulation
% Perform the forward projection
sino_array_low = FP.generateSinograms(Phantom, XRS_low.energies);

% Filter the sinogram with the detector
real_sinogram_low = Detector.filterSinogramArray(XRS_low, sino_array_low);

% Reconstruct with the back projector
Recon = BP.reconstruct(real_sinogram_low);
imtool3D(Recon);
set(gcf, 'name', 'Low Energy Reconstructed Image')

%% High energy simulation
% Perform the forward projection
sino_array_high = FP.generateSinograms(Phantom, XRS_high.energies);

% Filter the sinogram with the detector
real_sinogram_high = Detector.filterSinogramArray(XRS_high, sino_array_high);

% Reconstruct with the back projector
Recon = BP.reconstruct(real_sinogram_high);
imtool3D(Recon);
set(gcf, 'name', 'High Energy Reconstructed Image')