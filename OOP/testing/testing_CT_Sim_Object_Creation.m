%% Clear everything and get ready to simulate
clear
astra_clear

%% Define the phantom: a simple indexed image object
% test_small = IndexedImagePhantom();
% test_small.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantoms\test_small.tif');
% test_small.index_values = [255, 400, 800];
% test_small.material_list = {'Hammerstein Adipose', 'Hammerstein Glandular', 'Ca'};
% 
% test_small.element_size = [0.25, 0.25];

% Basic 2D phantom constructed from ellipses
% phantom = load('test_small.mat');
% F = fieldnames(phantom);
% phantom = phantom.(F{1});

% Simple phantom -- just a square of water
phantom = load('square.mat');
F = fieldnames(phantom);
phantom = phantom.(F{1});

% display the image with attenuation values it would have at an energy of
% 40kVp
%test_small.show(40);
clear F

%% Define the x-ray source
kVp = 100;
exposure = 100;

XRS = XRaySource(kVp, exposure);
XRS.addFilter('Al', 0.05);

% only choose a few energies to test the simulator at
% XRS.mask_values = [40];
% XRS.show()

clear kVp exposure
%% Create geometries
cfg.detector_element_width       = 0.5;
cfg.reconstruction_element_width = 0.1;
cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 400;
cfg.object_detector_distance     = 400;

Geoms = SimpleGeometries(phantom, cfg);
% Change the projection angles to a single direction
% Geoms.ProjectionGeometry.projection_angles = 0;

%% Create a ForwardProjector
FP = AstraForwardProjector(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
FP.useGPU = false;
% FP.astra_line_or_strip = 'line';

%% Create a detector
Detector = ChargeIntegratingDetector(Geoms.ProjectionGeometry);

 %% Create a back projector

BP = AstraFilteredBackProjector(Geoms.ProjectionGeometry, Geoms.ReconGeometry);
BP.useGPU = false;