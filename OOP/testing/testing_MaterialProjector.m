%% Clear everything and get ready to simulate
clear
astra_clear

%% Define the objects
% Phantom object
Phan = load('test_small.mat');
Phan = Phan.test_small;

% X-ray source
kVp = 100;
exposure = 100;

XRS = XRaySource(kVp, exposure);
XRS.addFilter('Al', 0.05);
% only choose a few energies to test the simulator at
XRS.mask_values = [40];
clear kVp exposure

% create geometries
cfg.detector_element_width       = 0.5;
cfg.projection_type              = 'fanbeam';
cfg.source_object_distance       = 400;
cfg.object_detector_distance     = 400;

Geoms = SimpleGeometries(Phan, cfg);

% forward projector
FP = AstraForwardProjector(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
FP.validate;

%% Generate material thickness sinograms
indexed_image  = Phan.indexed_image;
indexed_values = Phan.indexed_values;
num_materials  = numel(Phan.material_list);

material_sinograms = zeros([FP.sinogram_size, num_materials]);

for idx = 1 : num_materials;
    material_image = (indexed_image == indexed_values(idx));

    material_sinograms(:, :, idx) = FP.projectImage(material_image);
end

energy = 40;
attenuation_values = cellfun(@(X)X(energy), Phan.material_attenuation_vectors);
attenuation_values = permute(attenuation_values, [2,3,1]);

mat_sino = bsxfun(@times, attenuation_values, material_sinograms);
mat_sino = sum(mat_sino, 3);

sino_array = FP.generateSinograms(Phan, XRS.energies);

% imtool3D(material_sinograms,[])
%%
masks = Phan.materialMasks;
attenuation_values = Phan.materialAttenuations(40);
permuter = circshift((1:numel(attenuation_values))', -1)';
attenuation_values = permute(attenuation_values, permuter);

mat_sino2 = bsxfun(@times, attenuation_values, material_sinograms);
mat_sino2 = sum(mat_sino, 3);
