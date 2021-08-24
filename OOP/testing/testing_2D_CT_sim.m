%% Clear everything and get ready to simulate
clear
astra_clear

%% Load a 2D phantom from a prebuilt object
phantom = load('test_small.mat');
% get the actual object out of the returned struct
fn = fieldnames(phantom);
phantom = phantom.(fn{1});
clear fn
%% Define the x-ray source
kVp = 100;
exposure = 100;

XRS = XRaySource(kVp, exposure);
XRS.addFilter('Al', 0.5);

% only choose a few energies to test the simulator at
XRS.mask_values = [40 60 80];
% XRS.show()

clear kVp exposure
%% Create geometries
cfg.detector_element_width       = 2;
cfg.reconstruction_element_width = 0.25;
cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 200;
cfg.object_detector_distance     = 200;

Geoms = SimpleGeometries(phantom, cfg);
% Geoms.ProjectionGeometry.projection_angles = Geoms.ProjectionGeometry.projection_angles(1:180);

%% Create and run the Forward Projector
FP = AstraForwardProjector2D(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);

sino_array = FP.generateSinograms(phantom, XRS.energies);

imtool3D(sino_array);

%% Filter the sinogram with the detector
detector = ChargeIntegratingDetector(Geoms.ProjectionGeometry);

real_sinogram = detector.filterSinogramArray(XRS, sino_array);

imtool3D(real_sinogram, []);

%% Reconstruct with the back projector

BP = AstraFilteredBackProjector2D(Geoms.ProjectionGeometry, Geoms.ReconGeometry);
% BP.useGPU = false;

I = BP.reconstruct(real_sinogram);

figure
imtool3D(I,[]);