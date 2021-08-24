% This script is used to test the ASTRA package for quantitative accuracy
% of the resulting sinogram from forward projection and the resulting image
% from reconstruction. By quantitative accuracy, I mean that the pixels in
% the sinogram represent the correct value for mu*t for that projection,
% and that the reconstructed pixel values match the attenuation value of
% the input phantom.
%
% Explanations of the corrections:
%   GPU algorithms without a system matrix:
%     * Since there is no projector, 'line' vs 'strip' is irrelevant.
%     * For the 3D GPU algorithms, the coordinate system and units are
%     defined such that the voxel size of the volume input or the
%     reconstruction output is 1 unit on each side. This is the only
%	  consideration that requires a correction. These unit conversions can
%	  be done in the image domains or in the projection domains. Though it
%	  makes more sense physically to me to do conversions in the image
%	  domains since pixel values in the sinogram are dimensionless.
%
%#ok<*UNRCH>
%% Clear everything the right way
clear
astra_clear
% clc
%% Define the inputs to the simulation
% Create the phantom

% A simple cube phantom
atten_value = 1;
cube_length_pixels = 96;
P = zeros(128, 128, 128);
P(17:112, 17:112, 17:112) = atten_value; % 96 units on a side

det_pix_size   = 0.25;
image_pix_size = 0.5;
recon_pix_size = 0.75;

cone_or_parallel3d = 'cone'; % parallel3d won't work for the FDK reconstruction
% set to a large number to simulate parallel with conebeam, but not too
% large else the results won't make sense...
source_object_distance   = 50000;
object_detector_distance = 500;
projection_angles = linspace(0, 2*pi, 80); % can't do many angles without running out of memory

do_reconstruction_phase = 1;
do_display_images = 0;

super_sampling = 2;

%% Calculations from inputs
phantom_pixel_count = size(P);

% Compute the magnification on the detector
if strcmp(cone_or_parallel3d, 'parallel3d')
    magnification = 1;
else
    magnification = 1 + object_detector_distance / source_object_distance;
end 

% Determine the size of the detector necessary to view the whole phantom
physical_size = phantom_pixel_count .* image_pix_size;
% base the length off the max radius in the x-y direction
max_radius = norm(physical_size(1:2) ./ 2);
detector_length = 2.1 * magnification * max_radius;
% base the height off the height of the phantom
detector_height = 1.2 * magnification * physical_size(3);
% convert the physical measurements to number of elements
detector_size(1) = ceil(detector_length / det_pix_size);
detector_size(2) = ceil(detector_height / det_pix_size);

% Create the volume and projection geometries 
% NB: For 3D algorithms the internal units for the algorithms are defined
% such that the volume has voxels with sides of lenth 1.
vol_geom = astra_create_vol_geom(phantom_pixel_count(1), phantom_pixel_count(2), phantom_pixel_count(3));

% NB: Here we must take care to convert the distances to the correct units
% following the above coordinate system.
if strcmp(cone_or_parallel3d, 'cone')
    proj_geom = astra_create_proj_geom('cone',...
        det_pix_size/image_pix_size, det_pix_size/image_pix_size,...
        detector_size(2), detector_size(1),...
        projection_angles,...
        source_object_distance/image_pix_size,...
        object_detector_distance/image_pix_size);
else % use a parallel3d geometry
    proj_geom = astra_create_proj_geom('parallel3d',...
        det_pix_size/image_pix_size, det_pix_size/image_pix_size,...
        detector_size(2), detector_size(1),...
        projection_angles);
end

%% Run the Simulation
  %% Create the algorithm object

% Create the volume and sinogram objects

% NB: We must convert the units of attenuation in the input phantom into the
% units expected by the algorithm, i.e. we want units of 1/image_pix_size.
volume_id = astra_mex_data3d('create','-vol', vol_geom, P .* image_pix_size);
if strcmp(cone_or_parallel3d, 'cone')
    sinogram_id = astra_mex_data3d('create','-sinocone', proj_geom, 0);
else % using parallel3d
    sinogram_id = astra_mex_data3d('create','-sinocone', proj_geom, 0);
end

cfg = astra_struct('FP3D_CUDA');
cfg.ProjectionDataId = sinogram_id;
cfg.VolumeDataId = volume_id;
cfg.option.DetectorSuperSampling = super_sampling;

forw_proj_alg_id = astra_mex_algorithm('create', cfg);
astra_mex_algorithm('iterate', forw_proj_alg_id);

sinogram = astra_mex_data3d('get',sinogram_id);

% % NB: As an alternative to converting before the sinogram generation, we
% % could do the fllowing operation.
% sinogram = sinogram .* image_pix_size;

% optionally display the resulting sinogram
if do_display_images
    imtool3D(permute(sinogram, [3,1,2]), []);
end

% Output statistics to evaluate the resulting sinogram

% for checking the forward projection, we only care about the 0 deg
% projection which is easy to evaluate automatically
face_projection = sinogram(:,1,:);

% check the mean value of the projected phantom
%  we only include pixels that are greater than the mean of the nonzero
%  values in the array in order to remove background and edge values
% sino_check = im2bw( face_projection(:), graythresh(reconstruction) );
sino_check = face_projection >= mean(Colonize(face_projection(face_projection ~= 0)));

disp('Forward Projection Checks:');
disp('==========================');
fprintf('Projection Mean  = %g +- %g\n', mean(face_projection(sino_check)), std(face_projection(sino_check)));
fprintf('Expected mu*t    = %g\n', cube_length_pixels * image_pix_size * atten_value);

fprintf('Projection Area  = %g\n', sum(sino_check(:)));
fprintf('Expected Area    = %g\n', (cube_length_pixels *(image_pix_size/det_pix_size) * magnification)^2 );

if strcmp(cone_or_parallel3d, 'cone')
    fprintf('   Expected area only accounts for the front face, so it is expected to be\n   less than the projected area for conebeam.\n');
end

if ~do_reconstruction_phase
    disp(' '); % just creating a new line
    disp('Not performing the reconstruction');
    return
end

  %% Prepare for the reconstruction phase
% We now delete the forward projection objects and re-create the sinogram
% data object as we would do when loading an external sinogram. 

% NB: We also must recreate the projection geometry in order to deal with a
% change in units since, in the back projection, the recon pixel size
% defines the units and is set to unity (instead of the input pixel size as
% in the FP)
astra_mex_algorithm('delete', forw_proj_alg_id);
astra_mex_data3d('delete', sinogram_id);

if strcmp(cone_or_parallel3d, 'cone')
    proj_geom = astra_create_proj_geom('cone',...
        det_pix_size/recon_pix_size, det_pix_size/recon_pix_size,...
        detector_size(2), detector_size(1),...
        projection_angles,...
        source_object_distance/recon_pix_size,...
        object_detector_distance/recon_pix_size);
else % use a parallel3d geometry
    proj_geom = astra_create_proj_geom('parallel3d',...
        det_pix_size/recon_pix_size, det_pix_size/recon_pix_size,...
        detector_size(2), detector_size(1),...
        projection_angles);
end

% NB: we could modify the sinogram with a factor relating the image pixel
% and recon pixel sizes, but I chose to do the conversion in the image
% domain.
sinogram_id = astra_mex_data3d('create', '-sinocone', proj_geom, sinogram);

  %% Create the reconstruction volume

% convert the physical length to a number of elements
recon_pixel_count = ceil(physical_size ./ recon_pix_size);

recon_geom = astra_create_vol_geom(recon_pixel_count(1), recon_pixel_count(2), recon_pixel_count(3));

rec_id = astra_mex_data3d('create', '-vol', recon_geom);

  %% Create the back projector and algorithm objects

% Set up the parameters for the reconstruction algorithm
cfg = astra_struct('FDK_CUDA');
cfg.ReconstructionDataId = rec_id;
cfg.ProjectionDataId = sinogram_id;

% Create the algorithm object from the configuration structure
back_proj_alg_id = astra_mex_algorithm('create', cfg);

  %% Run the algorithm
astra_mex_algorithm('run', back_proj_alg_id);

% Get the result
reconstruction = astra_mex_data3d('get', rec_id);

% NB: Here we convert the algorithm units in which the recon pixel size is
% set to unity back to our physical units. The units of the reconstruction
% are in linear attenuation, i.e. inverse length.
reconstruction = reconstruction ./ det_pix_size;

% optionally display the resulting reconstructed image
if do_display_images
    imtool3D(reconstruction, []);
end

  %% Run the tests
% check statistics of the reconstructed pixels
%  we only want to include pixels that belong to the reconstructed cube, so
%  we use Otsu thresholding to select only those pixels
rec_check = im2bw( reconstruction(:), graythresh(reconstruction) );
% rec_check = reconstruction > mean(Colonize(reconstruction(reconstruction > 0.01)));

disp(' ') % writing a blank line
disp('Reconstruction Checks:');
disp('======================');
fprintf('Recon Mean       = %g +- %g.\n', mean(reconstruction(rec_check)), std(reconstruction(rec_check)));
fprintf('Expected Mean    = %g\n', atten_value);

fprintf('Recon Volume     = %g\n', sum(rec_check(:)));
fprintf('Expected Volume  = %g\n', (cube_length_pixels *(image_pix_size/recon_pix_size))^3 );


%% Clean up
astra_mex_data3d('delete', sinogram_id);
astra_mex_data3d('delete', rec_id);
astra_mex_algorithm('delete', back_proj_alg_id);