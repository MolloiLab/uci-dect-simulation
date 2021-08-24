function result = ApplyMotionBlur( sinogram, motion_blur_factor )
%APPLYMOTIONBLUR Applies motion blur to a sinogram
%
% result = ApplyMotionBlur( sinogram, motion_blur_factor )
%
%   Motion blur refers to the effect of the accumulation time of the
%   detector while taking projection images. In the simulation, each
%   projection is acquired at a single instant in time, but, in reality,
%   each image is acquired over a finite period. This function will
%   simulate that effect by averaging multiple instant time projections.
%
% INPUTS:
%   sinogram -- array containing projection data to be motion-blurred. Can
%   be 2D or 3D with the _first_ dimension containing the angle of
%   projection.
%
%   motion_blur_factor -- integer giving the number of adjacent projections
%   that are to be averaged; should divide evenly into the number of angles
%   in the sinogram.

% Input checking
% Check the dimensionality of the sinogram
sino_ndims = ndims(sinogram);
if sino_ndims ~= 2 && sino_ndims ~= 3
   error([mfilename ':InputNDims'],...
        'Input sinogram must be either 2D or 3D.'); 
end

num_input_projections = size(sinogram, 1);
num_output_projections = ceil( num_input_projections / motion_blur_factor );
% if the motion_blur_factor doesn't evenly divide the length of the
% sinogram, issue a warning and continue
if mod(num_input_projections, motion_blur_factor) ~= 0
    is_divisible = false;
    warning([mfilename ':NotEvenlyDivisible'],...
        'For best results, the ''motion_blur_factor'' should divide evenly into the number of projections.');
else
    is_divisible = true;
end

% Implement the averaging
% IDEA: In 2D can use a mean filter with 'filter' and treat the sinogram as
% a 1D array. This would may be the fastest implementation for 2D

% % use subasgn directly in the loop to avoid code assuming a specific
% % dimenionsionality of the sinogram
% S.type = '()';
% S.subs = cell(1, sino_ndims);
% S.subs(:) = {':'};

% pre-allocate the array
input_size = size(sinogram);
output_size = [num_output_projections, input_size( 2 : end )];
result = zeros( output_size );

if sino_ndims == 2
    
    % Loop through the output projections, except for the last one which
    % may need special care if there aren't 'motion_blur_factor' number of
    % projections remaining
    for proj_idx = 1 : num_output_projections-1
        blurred_projection = mean( sinogram( (proj_idx-1)*motion_blur_factor + 1 : proj_idx*motion_blur_factor, :) );
        result(proj_idx, :) = blurred_projection;
    end
    % Deal with the (possibly) special case of the last projection
    proj_idx = proj_idx + 1;
    blurred_projection = mean( sinogram( (proj_idx-1)*motion_blur_factor + 1 : end, :) );
    result(proj_idx, :) = blurred_projection;
    
elseif sino_ndims == 3
    
    % Loop through the output projections, except for the last one which
    % may need special care if there aren't 'motion_blur_factor' number of
    % projections remaining
    for proj_idx = 1 : num_output_projections
        blurred_projection = mean( sinogram((proj_idx-1)*motion_blur_factor + 1 : proj_idx*motion_blur_factor, :,:) );
        result(proj_idx, :,:) = blurred_projection;
    end
    % Deal with the (possibly) special case of the last projection
    proj_idx = proj_idx + 1;
    blurred_projection = mean( sinogram( (proj_idx-1)*motion_blur_factor + 1 : end, :,:) );
    result(proj_idx, :,:) = blurred_projection;
    
else
    error([mfilename, ':Whoopsie'], 'That should not have happened.');
end

end