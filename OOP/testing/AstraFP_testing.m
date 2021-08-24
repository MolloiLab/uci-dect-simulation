astra_clear
clear
load('square.mat');

cfg = ProjectionGeometry.input_struct('parallel');
% cfg = ProjectionGeometry.input_struct('fanbeam');
cfg.source_object_distance = 200;
cfg.object_detector_distance = 200;
cfg.detector_size = 400;
cfg.detector_element_size = 0.5;
cfg.projection_angles = (1:360) .* pi/180;

pg = ProjectionGeometry(cfg);

afp = AstraForwardProjector(square, pg);
afp.super_sampling_factor = 8;

sino = afp.generateSinogram(40);

imtool3D(sino)