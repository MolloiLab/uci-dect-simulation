% Script to test the functionality of the IndexedImagePhantom object

%% Define a simple indexed image object from an image
test = IndexedImagePhantom();
test.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantom_tiffs\first_test.tif');
test.indexed_values = [33924, 24672, 48316, 27242];
test.material_list = {'Hammerstein Adipose', 'Hammerstein Glandular', 'Ca', 'Si'};

test.element_size = [0.5, 0.5];

test_small = test;
save('test_small.mat', 'test_small');
% display the image with attenuation values it would have at an energy of
% 40kVp
test.show(150);

%% Create a 3D cube phantom
side = 100; % in pixels
image_size = 128;
image_size = [image_size, image_size, image_size];

image_data = zeros(image_size);
spacing = (image_size(1) - side) / 2;
SS = ceil(spacing)+1;
SE = floor(spacing) - 1;
image_data(SS:end-SE, SS:end-SE, SS:end-SE) = 1;

cube = IndexedImagePhantom();
cube.indexed_image = image_data;
cube.indexed_values = 1;
cube.material_list = {'Water'};
% choose an element size that makes the line integral equal to 1 at an
% energy of 40 kVp
cube.element_size = [0.5, 0.5, 0.5];
cube.validate();
el_size = 1/(side * cube.material_attenuation_vectors{1}(40));
cube.element_size = [el_size, el_size, el_size];

% display the image with attenuation values it would have at an energy of
% 40kVp
cube.show(40);

clear side spacing image_size SS SE

%% Create a 3D sphere phantom
radius = 40; % in pixels
image_size = [128, 128, 128];

image_data = zeros(image_size);

[XX, YY, ZZ] = meshgrid( (1:image_size(2)) - image_size(2)/2, ...
                     (1:image_size(1)) - image_size(1)/2,...
                     (1:image_size(3)) - image_size(3)/2);

image_data((XX.^2 + YY.^2 + ZZ.^2) < radius^2) = 1;

sphere = IndexedImagePhantom();
sphere.indexed_image = image_data;
sphere.indexed_values = 1;
sphere.material_list = {'Water'};
sphere.element_size = [0.5, 0.5, 0.5];

% display the image with attenuation values it would have at an energy of
% 40kVp
sphere.show(40);

clear radius image_size image_data XX YY ZZ