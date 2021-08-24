%% Clear everything and get ready to simulate
clear
astra_clear

%% Load a 3D phantom from a prebuilt object
% phantom = load('prebuilt_objects\face3D.mat');
phantom = load('prebuilt_objects\cube.mat');
% get the actual object out of the returned struct
fn = fieldnames(phantom);
phantom = phantom.(fn{1});
clear fn
% 
% % Create a simple hollow cube phantom
% cube = zeros(128,128,128);
% cube(17:112,17:112,17:112) = 1;
% cube(1:96,33:96,33:96) = 0;
% 
% for i = 1 : size(cube,3)
%     cube(:,:,i) = imrotate(cube(:,:,i), 20, 'crop');
% end
% cube = permute(cube, [1,3,2]);

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
cfg.detector_element_width       = 0.1;
cfg.reconstruction_element_width = 0.25;
cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 200;
cfg.object_detector_distance     = 400;

Geoms = SimpleGeometries(phantom, cfg);
Geoms.ProjectionGeometry.projection_angles = Geoms.ProjectionGeometry.projection_angles(1:4:end);

%% Create the Forward Projector objects
clear AFP AstraForwardProjector3D
AFP = AstraForwardProjector3D(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
AFP.validate();
% also make a material forward projector for comparison
clear MFP MaterialForwardProjectorAdapter
MFP = MaterialForwardProjectorAdapter(AFP);

%% Create the Detector
clear CID ChargeIntegratingDetector
CID = ChargeIntegratingDetector(Geoms.ProjectionGeometry);
CID.noise_type = 'gaussian';
%% test the forward projection with a single image
tic
I = phantom.generateAttenuationMap(40);
proj_data = AFP.projectImage(I);
toc
DisplayProjectionsFromSinogram(proj_data);

%% test the material forward projection
tic
proj_data2 = MFP.generateSinograms(phantom, [40, 60, 80]);
toc

%% Detector
A = CID.filterSinogramArray(XRS, proj_data2);

DisplayProjectionsFromSinogram(A);