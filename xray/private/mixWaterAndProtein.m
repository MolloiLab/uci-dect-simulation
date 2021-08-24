function tissueComp = mixWaterAndProtein( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Ca', 1.55, [20], [1]}

% Wfrac = str2double( inputString( end-1 : end ) ) / 100;
Wfrac= sscanf(inputString,'WaterAndProtein%f')/100;
if Wfrac > 1
    error('Fraction of water cannot exceed 1')
end

Pfrac = 1 - Wfrac;
% Densities and zFractions from Hammerstien
roW = 1;
roP = 1.35;
zFracWater = [0.111898   0.0000000  0.0000000  0.888102    0.000000000 ];
zFracP = [0.070914697 0.531462668 0.161143807 0.226546897 0.009931932];

density = Wfrac * roW + Pfrac * roP;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Wfrac * roW * zFracWater + Pfrac * roP * zFracP;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'WaterAndProtein', density, [1, 6, 7, 8, 16], zFracs};
