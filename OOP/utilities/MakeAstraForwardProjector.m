function ASTRA_FP = MakeAstraForwardProjector( volume_geometry, projection_geometry )
%MAKEASTRAFORWARDPROJECTOR Creates an AstraForwardProjector object
%   Since the ASTRA classes are split into 2D and 3D, this convenience
%   function is used to create the correct one automatically.

if volume_geometry.dimensionality == 2
    ASTRA_FP = AstraForwardProjector2D(volume_geometry, projection_geometry);
elseif volume_geometry.dimensionality == 3
    ASTRA_FP = AstraForwardProjector3D(volume_geometry, projection_geometry);
else
    error('Does not compute . . . Bzzzzz Whrrrr Bzzzz');
end

end
