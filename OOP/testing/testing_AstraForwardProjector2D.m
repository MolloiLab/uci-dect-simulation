% This script is meant to test the quantitative accuracy of a
% ForwardProjector by projecting a square of known size and density at a
% single angle and checking the u*t values.
% The 

%% Clear everything so that we have a clean slate
astra_clear
clear

%% Define the phantom: a simple square indexed image object
% The phantom is a 256 by 256 pixel water equivalent square

Square = IndexedImagePhantom();
image = zeros(300, 300);
image(23:end-22, 23:end-22) = 1;
Square.indexed_image = image;
Square.indexed_values = 1;
Square.element_size = [1 1]; % will be overwritten later
Square.material_list = {'Water'};

% Call to validate will cause the material_attenuation_vectors to be
% generated
Square.validate();

% We choose the element_size so that the result of mu*t integrated through
% the square is equal to unity
energy  = 40;

expected_attenuation = (Square.material_attenuation_vectors{1}(energy)*256);


%% Create the forward projection geometry
cfg.detector_element_width       = 2;
cfg.projection_type              = 'parallel';
cfg.source_object_distance       = 400;
cfg.object_detector_distance     = 400;

% Use SimpleGeometries to fill in the rest of the parameters
Geoms = SimpleGeometries(Square, cfg);
% Change the projection angles to a single direction
Geoms.ProjectionGeometry.projection_angles = 0;

%% Create and configure the ForwardProjector to be tested
FP = AstraForwardProjector2D(Geoms.VolumeGeometry, Geoms.ProjectionGeometry);
% FP.useGPU = false;
% FP.astra_line_or_strip = 'line';

%% Perform the test
sino_array = FP.generateSinograms(Square, energy);

% take the average of the top 50 values which should all be close to one,
%  there could be values near the edges that are less than one due to the
%  magnification and hence we want to exclude those
sorted = sort(sino_array(:));

result = mean(sorted(end-49:end));

disp(['Expected value: ' num2str(expected_attenuation)]);
disp(['Mean value    : ' num2str(result)]);