function tissueComp = mixWaterAndIodine( inputString )
% Creates a material that simulates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'I ', 4.933, [53], [1]}

% Wfrac = str2double( inputString( end-1 : end ) ) / 100;
Wfrac = sscanf(inputString, 'WaterAndIodine%f') / 100;
if Wfrac > 1
    error('Fraction of water cannot exceed 1')
end
Ifrac = 1 - Wfrac;
% Densities and zFractions from Hammerstien
roW = 1;
roI = 4.933;
zFracWater = [0.111898    0.888102    0.000000000 ];
zFracI = [0.000000000    0.000000000   1.0000000];

density = Wfrac * roW + Ifrac * roI;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Wfrac * roW * zFracWater + Ifrac * roI * zFracI;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'WaterAndIodine', density, [1, 8, 53], zFracs};
