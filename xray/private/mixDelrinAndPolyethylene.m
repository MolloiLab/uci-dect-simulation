function tissueComp = mixDelrinAndPolyethylene( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Delrin', 1.4101, [1,6,8],[0.0671, 0.4000, 0.5329]}
% {'Polyethylene', 0.93,[1 6],[0.143716 0.856284]}

% Delfrac = str2double( inputString( end-1 : end ) ) / 100;
Delfrac = sscanf(inputString, 'DelrinAndPolyethylene%f') / 100;
if Delfrac > 1
    error ('Fraction of delrin cannot exceed 1')
end
Polyfrac = 1 - Delfrac;
% Densities and zFractions from Hammerstien
roDel = 1.4101;
roPoly = 0.93;
zFracDel = [0.0671    0.4000000    0.53292 ];
zFracPoly = [0.143716    0.856284   0.000000];

density = Delfrac * roDel + Polyfrac * roPoly;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Delfrac * roDel * zFracDel + Polyfrac * roPoly * zFracPoly;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'DelrinAndPolyethylene', density, [1, 6, 8], zFracs};