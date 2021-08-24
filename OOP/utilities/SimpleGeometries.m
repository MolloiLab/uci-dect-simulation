function geoms = SimpleGeometries( input_VolumeGeometry, cfg )
%SIMPLEGEOMETRIES
%   
%   Produces simple geometries given basic information
% 
% only required if a recon geom is desired
% cfg.reconstruction_element_width 
%
% cfg.detector_element_width
% cfg.projection_type
% cfg.projection_angles
% cfg.source_object_distance
% cfg.object_detector_distance

%% Input parsing and checking
% simple check for required configuration fields
required_fields = {'detector_element_width', 'projection_type'};
for field = required_fields
    if ~isfield(cfg, field{1})
        error([mfilename ':Input'], '%s is a required field.', field{1});
    end
end
%  additional inputs required for fanbeam
if strcmpi(cfg.projection_type, 'fanbeam')
    if ~isfield(cfg, 'source_object_distance')
        error('source_object_distance is a required field when using fanbeam.');
    end
    if ~isfield(cfg, 'object_detector_distance')
        error('object_detector_distance is a required field when using fanbeam.');
    end
    magnification = 1 + cfg.object_detector_distance / cfg.source_object_distance;
else
    magnification = 1;
end
% check for the existence of a projection_angles field and give a default
% if it does not exist
if ~isfield(cfg, 'projection_angles')
    cfg.projection_angles = (0:1:359) .* (pi/180);
    warning('Projection angles were not specified, using default 360 projections');
end
%  check if the angles look like degrees instead of radians
if max(abs(cfg.projection_angles) > 60)
    error([mfilename, ':RadiansCheck'], 'projection_angles is expected to be radians, not degrees.');
end

%  allow a phantom as an input for the input vol geom
if isa(input_VolumeGeometry, 'Phantom_Base')
    input_VolumeGeometry = input_VolumeGeometry.VolumeGeometry;
end

%  make sure that we have found a VolumeGeometry
if ~isa(input_VolumeGeometry, 'VolumeGeometry')
    error('Expected a VolumeGeometry or a Phantom_Base as the first input.')
end

dimensionality       = input_VolumeGeometry.dimensionality;
input_physical_size  = input_VolumeGeometry.physical_size;
geoms.VolumeGeometry = input_VolumeGeometry;

%% Construct a projection geometry

%  determine the physical length of detector that we will need based on the
%  physical size of the volume geometry
if dimensionality == 2
    max_radius = norm(input_physical_size ./ 2);
    detector_length = 2 * magnification * max_radius;
    % convert the physical length to a number of elements
    detector_length = ceil(detector_length / cfg.detector_element_width);
    detector_size = detector_length;
elseif dimensionality == 3
    % rotation is about the z-axis and we could have different radii for
    % the x and y axes implying a detector that isn't square
    % (using the dim == 2 method results in a detector that is too large)
    max_radius(1) = norm(input_physical_size([1,2]) ./ 2);
    max_radius(2) = norm(input_physical_size([2,3]) ./ 2);
    detector_size = 2 * magnification .* max_radius;
    % convert to pixels
    detector_size = ceil(detector_size ./ cfg.detector_element_width);
else
    error('That should not have happened.');
end

%  create the input configuration for a ProjectionGeometry object, taking
%  care to allow for 2D and 3D geometries
pg_config.ray_geometry          = cfg.projection_type;
pg_config.detector_size         = detector_size;
pg_config.detector_element_size = cfg.detector_element_width .* ones(1, dimensionality-1);
pg_config.projection_angles     = cfg.projection_angles;
% additional variables if doing fanbeam
if strcmpi(cfg.projection_type, 'fanbeam')
    pg_config.source_object_distance   = cfg.source_object_distance;
    pg_config.object_detector_distance = cfg.object_detector_distance;
end

geoms.ProjectionGeometry = ProjectionGeometry(pg_config);

%% Construct a VolumeGeometry to describe the reconstruction
% Only do this if a recon pixel size is given as input
if isfield(cfg, 'reconstruction_element_width')
    recon_size = input_physical_size ./ cfg.reconstruction_element_width;
    recon_size = ceil(recon_size);
    recon_element_size = cfg.reconstruction_element_width .* ones(1, dimensionality);

    geoms.ReconGeometry = VolumeGeometry(recon_element_size, recon_size);
end

end