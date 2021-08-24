function tissueComp = mixLipidAndProtein( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Lipid', 0.92, [1,6,8], [0.121690809 0.766868267 0.111440924]}
% {'Ca', 1.55, [20], [1]}

% Lfrac = str2double( inputString( end-1 : end ) ) / 100;
Lfrac = sscanf(inputString, 'LipidAndProtein%f') / 100;
if Lfrac > 1
    error('Fraction of lipid cannot exceed 1')
end

Pfrac = 1 - Lfrac;
% Densities and zFractions from Hammerstien
roL = 0.92;
roP = 1.35;
zFracLipid = [0.121690809 0.766868267 0.0000000 0.111440924 0.0000000];
zFracP    = [0.070914697 0.531462668 0.161143807 0.226546897 0.009931932];

density = Lfrac * roL + Pfrac * roP;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Lfrac * roL * zFracLipid + Pfrac * roP * zFracP;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'LipidAndProtein', density, [1, 6, 7, 8, 16], zFracs};
