function tissueComp = mixLipidAndCa( inputString )
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
Lfrac = sscanf(inputString, 'LipidAndCa%f') / 100;
if Lfrac > 1
    error('Fraction of lipid cannot exceed 1')
end

CAfrac = 1 - Lfrac;
% Densities and zFractions from Hammerstien
roL = 0.92;
roCa = 1.55;
zFracLipid = [0.121690809 0.766868267 0.111440924 0.0000000];
zFracCa    = [0.000000000 0.000000000 0.000000000 1.0000000];

density = Lfrac * roL + CAfrac * roCa;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Lfrac * roL * zFracLipid + CAfrac * roCa * zFracCa;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'LipidAndCa', density, [1, 6, 8, 20], zFracs};
