% This script is used to test the ASTRA package for quantitative accuracy
% of the resulting sinogram from forward projection and the resulting image
% from reconstruction. By quantitative accuracy, I mean that the pixels in
% the sinogram represent the correct value for mu*t for that projection,
% and that the reconstructed pixel values match the attenuation value of
% the input phantom.
%
% Explanations of the corrections for ForwardProjection:
%   CPU algorithms based on the system matrix:
%     * 'line' scaling is 1/image_pixel_size
%     * 'strip' scaling is 1/image_pixel_size/detector_pixel_size
%     * For parallel beam, these factors are all that is needed
%     * For fanflat, there is an additional factor of the magnification but
%       only for strip
%   GPU algorithms without a system matrix:
%     * Since there is no projector, 'line' vs 'strip' is irrelevant.
%     * The scaling factors make the values closer, but the errors to the
%       expected values are greater than they are for CPU algorithms.
%     * Parallel beam scaling is image_pix_size/detector_pix_size
%     * Fanflat doesn't require any scaling factor
%
% Corrections for BackProjection don't make as much sense to me. The CPU
% factor is 1 / (recon_pix_size)^2, with an extra factor of the
% magnification when using fanflat. For the GPU, parallel beam works as is
% but fanbeam doesn't make sense at all...the values are multiple orders of
% magnitude off from what they should be.
%
%#ok<*UNRCH> 
%#ok<*SNASGU>
%#ok<*NASGU>
%% Clear everything the right way
clear % using clear all with ASTRA is dangerous -> can lead to crashes.
astra_clear
imtool close all
clc
%% Define the inputs to the simulation
% Create the phantom

% A simple square phantom
atten_value = 1;
P = zeros(256);
P(33:224, 33:224) = atten_value; % length is 192 on each side
square_length_pixels = 192;

det_pix_size   = 1;
image_pix_size = 2;
recon_pix_size = 1;

fanflat_or_parallel = 'fanflat';
strip_or_line       = 'line';
source_object_distance   = 500;
object_detector_distance = 1000;
projection_angles = linspace(0, 2*pi, 180);

super_sampling = 1;

% Choose whether or not to use the GPU
FP_use_GPU = 1;
BP_use_GPU = 0;

% Available algorithms: FBP (TODO check others as well)
BP_algorithm = 'FBP'; %
% TODO: number of iterations for iterative algorithms
% BP_iterations = 20;

% Some flags for modifying the testing framework
do_adjust_sinogram = 1;
do_adjust_reconstruction = 1;
do_reconstruction_phase = 1;
do_display_images = 1;

%% NB: Compute the scaling factors dependent on the input

% Compute the magnification which is needed for the scaling factors
if strcmp(fanflat_or_parallel, 'parallel')
    magnification = 1;
else
    magnification = 1 + object_detector_distance / source_object_distance;
end

% Multiplicative factors to be applied to the sinogram after doing the
% forward projection to obtain correct values for mu*t
if FP_use_GPU
    % Projections on the GPU 
    % line vs strip is irrelevant for GPU since there is no projector
    switch fanflat_or_parallel
        case 'parallel'
            FP_scaling = 1/det_pix_size;
        case 'fanflat'
            FP_scaling = 1;
    end
else % FP_use_GPU is false => using the CPU
    switch strip_or_line
        case 'line'
%             FP_scaling = 1/image_pix_size;
            FP_scaling = 1;
        case 'strip'
%             FP_scaling = 1/det_pix_size/image_pix_size;
            FP_scaling = 1/det_pix_size;
            if strcmp(fanflat_or_parallel, 'fanflat')
                FP_scaling = FP_scaling * magnification;
            end
    end
end

% Multiplicative factors applied to the reconstruction volume in order to
% acheive the correct value for the attenuation of the phantom
if BP_use_GPU
    % Reconstruction on the GPU 
    % line vs strip is irrelevant for GPU since there is no projector
    switch fanflat_or_parallel
        case 'parallel'
            BP_scaling = 1;
        case 'fanflat'
            BP_scaling = 5.235023408145995e+05; % random adjustment...
    end
else % BP_use_GPU is false => using the CPU
    switch strip_or_line
        case 'line'
            BP_scaling = 1 / (recon_pix_size)^2;
        case 'strip'
            % strip adds an additional factor of the detector pixel size
            BP_scaling = 1/(recon_pix_size^2)/det_pix_size;
            % and requires modification due to magnification when doing
            % fanflat
            if strcmp(fanflat_or_parallel, 'fanflat')
                BP_scaling = BP_scaling * magnification;
            end
    end
end

%% Calculations from inputs
phantom_pixel_count = size(P);

physical_size = phantom_pixel_count .* image_pix_size;
max_radius = norm(physical_size ./ 2);
detector_length = 2.1 * magnification * max_radius;

% convert the physical length to a number of elements
detector_size = ceil(detector_length / det_pix_size);

vol_geom = astra_create_vol_geom(phantom_pixel_count(1), phantom_pixel_count(2),...
                -physical_size(2)/2, physical_size(2)/2, -physical_size(1)/2, physical_size(1)/2);

if strcmp(fanflat_or_parallel, 'fanflat')
    proj_type = [strip_or_line '_fanflat'];
    proj_geom = astra_create_proj_geom(fanflat_or_parallel,...
        det_pix_size,... detector spacing
        detector_size,...
        projection_angles,...
        source_object_distance,...
        object_detector_distance);
else
    proj_type = strip_or_line;
    proj_geom = astra_create_proj_geom(fanflat_or_parallel,...
        det_pix_size,... detector spacing
        detector_size,...
        projection_angles);
end

% Create the forward projector object which will only be used for CPU
% algorithms
forw_proj_id = astra_create_projector(proj_type, proj_geom, vol_geom);

%% Run the Simulation
  %% Create the algorithm object

% Create the volume and sinogram objects
volume_id = astra_mex_data2d('create','-vol', vol_geom, P);
sinogram_id = astra_mex_data2d('create','-sino', proj_geom, 0);

if FP_use_GPU
    FP_type = 'FP_CUDA';
else % use CPU
    FP_type = 'FP';
end

cfg = astra_struct(FP_type);
cfg.ProjectionDataId = sinogram_id;
cfg.VolumeDataId = volume_id;

if FP_use_GPU
    cfg.option.DetectorSuperSampling = super_sampling;
else % use CPU, so we add a projector object
    cfg.ProjectorId = forw_proj_id;
end

forw_proj_alg_id = astra_mex_algorithm('create', cfg);
astra_mex_algorithm('iterate', forw_proj_alg_id);

sinogram = astra_mex_data2d('get',sinogram_id);

% All of the above is essentially equivalent to the following, but is
% written explicitly for completeness and finer control.
% if FP_use_GPU
%     [sinogram_id, sinogram] = astra_create_sino_gpu(P, proj_geom, vol_geom);
% else
%     [sinogram_id, sinogram] = astra_create_sino(P, forw_proj_id);
% end

% optionally apply the correction to acheive correctness of the sinogram
if do_adjust_sinogram
    fprintf('Adjusting sinogram: multiplying by %g.\n', FP_scaling);
    sinogram = sinogram .* FP_scaling;
end

% optionally display the resulting sinogram
if do_display_images
    imtool(sinogram, []);
end

zero_deg_proj = sinogram(1, :);
sino_check = zero_deg_proj >= 0.9*mean(Colonize(zero_deg_proj(zero_deg_proj ~= 0)));
% sino_check = im2bw( zero_deg_proj(:), graythresh(zero_deg_proj) );

disp('Forward Projection Checks:');
disp('==========================');
fprintf('Edge proj mean   = %g +- %g\n', mean(zero_deg_proj(sino_check)), std(zero_deg_proj(sino_check)));
fprintf('Expected mean    = %g\n', square_length_pixels * atten_value * image_pix_size);

fprintf('Sinogram maximum = %g\n', max(sinogram(:)));
fprintf('Expected maximum = %g\n', sqrt(2) * square_length_pixels * atten_value * image_pix_size);

fprintf('Edge proj length = %g\n', sum(sino_check(:)));
fprintf('Expected length  = %g\n', square_length_pixels * image_pix_size/det_pix_size * magnification);
% Issue a warning about inaccuracies when using fanflat
if strcmp(fanflat_or_parallel, 'fanflat')
    fprintf('   Expected length is may be innacurate when using fanbeam.\n');
end
disp(' '); % just creating a new line
% break here if we are not doing the reconstruction
if ~do_reconstruction_phase
    disp('Not performing the reconstruction');
    return
end

  %% Prepare for the reconstruction phase
% We now delete the forward projection objects and re-create the sinogram
% data object as we would do when loading an external sinogram
astra_mex_algorithm('delete', forw_proj_alg_id);
astra_mex_data2d('delete', sinogram_id);
astra_mex_projector('delete', forw_proj_id);

sinogram_id = astra_mex_data2d('create', '-sino', proj_geom, sinogram);

  %% Create the reconstruction volume

% convert the physical length to a number of elements
recon_pixel_count = ceil(physical_size ./ recon_pix_size);

recon_geom = astra_create_vol_geom(recon_pixel_count(1), recon_pixel_count(2),...
                -physical_size(2)/2, physical_size(2)/2, -physical_size(1)/2, physical_size(1)/2);

rec_id = astra_mex_data2d('create', '-vol', recon_geom);

  %% Create the back projector and algorithm objects
back_proj_id = astra_create_projector(proj_type, proj_geom, recon_geom);

% Set up the parameters for a reconstruction algorithm
if BP_use_GPU
    cfg = astra_struct('FBP_CUDA');
    cfg.option.PixelSuperSampling = super_sampling;

%     cfg.ProjectorId             = back_proj_id;
    cfg.ProjectionDataId        = sinogram_id;
    cfg.ReconstructionDataId    = rec_id;
    cfg.FilterType              = 'ram-lak';

    this.astra_id_algorithm = astra_mex_algorithm('create', cfg);
    
else % use CPU for back projection
    cfg = astra_struct(BP_algorithm);
    cfg.ReconstructionDataId = rec_id;
    cfg.ProjectionDataId = sinogram_id;
    cfg.ProjectorId = back_proj_id;
end

% Create the algorithm object from the configuration structure
back_proj_alg_id = astra_mex_algorithm('create', cfg);

  %% Run the algorithm
if any(strcmp(BP_algorithm, {'FBP'}))
    astra_mex_algorithm('run', back_proj_alg_id);
else % TODO iterative algorithm
%     astra_mex_algorithm('iterate', back_proj_alg_id, BP_iterations);
end

% Get the result
reconstruction = astra_mex_data2d('get', rec_id);

% optionally apply the correction to acheive correctness of the
% reconstruction
if do_adjust_reconstruction
    fprintf('Adjusting reconstruction: multiplying by %g.\n', BP_scaling);
    reconstruction = reconstruction .* BP_scaling;
end

% optionally display the resulting reconstruction
if do_display_images
    imtool(reconstruction, []);
end

  %% Run the tests
% check statistics of the reconstructed pixels
%  we only want to include pixels that belong to the reconstructed square,
%  so we use Otsu thresholding to select only those pixels
rec_check = im2bw( reconstruction(:), graythresh(reconstruction) );

disp('Reconstruction Checks:');
disp('======================');
fprintf('Recon Mean       = %g +- %g.\n', mean(reconstruction(rec_check)), std(reconstruction(rec_check)));
fprintf('Expected Mean    = %g\n', atten_value);

fprintf('Recon Area       = %g\n', sum(rec_check(:)));
fprintf('Expected Area    = %g\n', (square_length_pixels *(image_pix_size/recon_pix_size))^2 );

%% Clean up
astra_mex_data2d('delete', sinogram_id);
astra_mex_data2d('delete', rec_id);
astra_mex_projector('delete', back_proj_id);
astra_mex_algorithm('delete', back_proj_alg_id);