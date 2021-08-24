%% Initial prototype implementations for MaskMaker
% Goal is to draw ellipses in 3D and tranlate them into a pixelated image
% volume

% origin of the volume is assumed to be at its center, which is a point
% between pixels
image_size = 256;
vol = zeros(image_size, image_size, image_size);

% Create a sphere
radius = 100;
center = [0,0,0];

% Basic algorithm:
%  1) Genereate the coordinates of the center of each pixel
%  2) Shift the coordinate system so the center of the object is at the
%     origin of the primed coordinate system
%  3) Use the defining equation of the object to check if pixels are inside
%     of it

% 1) Generate the coordinates for each pixel

% Initial coordinate system is such that the first pixel in the volume is
% at the origin
grid_coords = 0:image_size-1;
[X, Y, Z] = meshgrid(grid_coords, grid_coords, grid_coords);
% turn them into a matrix of points (one point per row)
grid_coords = [X(:), Y(:), Z(:)];
% compute the distance of one coordinate to the center of the grid
dist = image_size/2 - 0.5;
% shift the grid points
grid_coords = grid_coords - dist;
% X = X - dist; Y = Y - dist; Z = Z - dist;

% At this point, the coordinates are relative to the center of the volume.

%  2) Shift the coordinate system so the center of the object is at the
%     origin of the primed coordinate system

primed_coords = grid_coords;
% Shift them such that the [0,0,0] corresponds to the center of the object
% XX = X; YY = Y; ZZ = Z;
primed_coords = bsxfun(@minus, primed_coords, center);

Xp = primed_coords(:,1);
Yp = primed_coords(:,2);
Zp = primed_coords(:,3);
% Use the defining equation of the object to check which points fall on the
% interior and then assign those points a value
inds = Xp.^2 + Yp.^2 + Zp.^2 < radius^2;

vol(inds) = 1;

%% Test bed for the MaskMaker
clear MM MaskMaker
vol_size = 128;
MM = MaskMaker([vol_size vol_size vol_size]);

% % How to make a sphere
% S = struct();
% S.radius = 20;
% S.center = [10, 10, 10];
% mask = MM.makeSphere(S);
% imtool3D(mask);

% % How to make an ellipsoid
% S = struct();
% S.center = [0, 0, 0];
% S.semiX = 80;
% S.semiY = 100;
% S.semiZ = 100;
% mask = MM.makeEllipse(S);
% imtool3D(mask);

% % How to make a cylinder
% S = struct();
% S.center = [0, 0, 0];
% S.radius = 10;
% mask = MM.makeCylinder(S);
% imtool3D(mask);

% How to make a cuboid
S = struct();
S.center = [0, 0, 0];
S.phi = pi/4;
S.theta = pi/3;
S.psi = 0;
S.sideX = 40;
S.sideY = 60;
S.sideZ = 80;
mask = MM.makeCuboid(S);
imtool3D(mask);

%% Testing of the Euler angle rotations of the MaskMaker
% Everything works as I want which means that a positive angle corresponds
% to a right handed rotations of the object about the positive axis. Be
% aware that, when using imtool3D, the y-axis points downward since we are
% looking towards the positive x-axis
clear MM MaskMaker
MM = MaskMaker([256 256 256]);

S = struct();
S.phi = pi/8;
S.theta = pi/8;
% S.psi = pi/8;
S.semiX = 20;
S.semiY = 80;
S.semiZ = 120;

MM.clearMask();
A = MM.makeEllipse(S);

clf
gv = (0:255) - 256/2;
[X,Y,Z] = meshgrid(gv,gv,gv);
isosurface(X,Y,Z, A, 0.5);
axis_length = 256*0.5+2;
axis([-axis_length axis_length -axis_length axis_length -axis_length axis_length]);
xlabel('x');
ylabel('y');
zlabel('z');
% imtool3D(A);

%% Creating a 3D "face" phantom for testing
% Idea is to make a phantom with two eyes and a mouth. Meant to be
% moderatly interesting to project and reconstruct while also being fun.
vol_size = [200, 200, 200];
face = zeros(vol_size);

clear MM MaskMaker
MM = MaskMaker(vol_size);

% Make the basic structure of the face, a flattened ellipse
S = struct();
S.semiX = 80;
S.semiY = 100;
S.semiZ = 100;
mask = MM.makeEllipse(S);
face(mask) = 1;


% Make the mouth which is an oblong ellipse
S = struct();
S.semiX = 30;
S.semiY = 70;
S.semiZ = 20;
S.center = [0, 0, -40];
mask = MM.makeEllipse(S);
face(mask) = 2;

% Make the eyes which are just spheres
S = struct();
S.radius = 20;
S.center = [0, -40, 40];
mask = MM.makeSphere(S);
face(mask) = 3;

S.center = [0, 40, 40];
mask = MM.makeSphere(S);
face(mask) = 4;

% Possible visualizations of the phantom
% imtool3D(face);
proj = sum(face, 2); imtool(squeeze(proj),[])

%% Saving as a IndexedImagePhantom object
face3D = IndexedImagePhantom();
face3D.indexed_image = uint16(face);
face3D.element_size = [1, 1, 1];
face3D.indexed_values = [1,2,3,4];
face3D.material_list = {'Water', 'Air, Dry (near sea level)',...
                        'Iodine 8mg.ml', 'Iodine 8mg.ml'};
                    
save('face3D.mat', 'face3D');
