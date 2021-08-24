function DisplayProjectionsFromSinogram( sinogram )
%DISPLAYPROJECTIONSFROMSINOGRAM Converts a 3D sinogram into a nice visualization
% Transforms the sinogram data and displays it in an easy to interpret way.
% The z-axis corresponds to the angle so that each 2D slice is a projection
% of the phantom from the view of the source.

if ndims(sinogram) ~= 3
    error('This function is for 3D sinograms. Simply use imshow or imtool for 2D sinograms.');
end

% permute the dimensions such that the angle axis becomes the z-axis
% The two flipdim's are ensure that the vertical axis of the image is the
% same as the rotation axis of the object and that the rotation is
% right-handed about this axis.
    imtool3D(...
        flipdim(...
            flipdim(...
                permute(sinogram, [3,2,1]),...
            1),...
         3)...
    )
    
%     imtool3D(flipdim(flipdim(permute(sinogram, [3,2,1]), 1), 3));

end

