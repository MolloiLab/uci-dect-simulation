function ASTRA_BP = MakeAstraFilteredBackProjector( volume_geometry, projection_geometry, BP_params )
%MAKEASTRAFILTEREDBACKPROJECTOR Creates an AstraFilteredBackProjector object
%   Since the ASTRA classes are split into 2D and 3D, this convenience
%   function is used to create the correct one automatically.

if volume_geometry.dimensionality == 2
    ASTRA_BP = AstraFilteredBackProjector2D(volume_geometry, projection_geometry, BP_params);
elseif volume_geometry.dimensionality == 3
    ASTRA_BP = AstraFilteredBackProjector3D(volume_geometry, projection_geometry);
else
    error('Does not compute . . . Bzzzzz Whrrrr Bzzzz');
end

end

