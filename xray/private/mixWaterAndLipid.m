function tissueComp = mixWaterAndLipid( inputString )
% Creates a material that simluates a mix of water and lipid.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Lipid', 0.92, [1,6,8], [0.121690809 0.766868267 0.111440924]}

% Wfrac = str2double( inputString( end-1 : end ) ) / 100;
numInputs = sscanf(inputString,'Water%fAndLipid%f' ) / 100;
Wfrac = numInputs(1);
if Wfrac > 1
    error('Fraction of water cannot exceed 1')
end
Lfrac = 1 - Wfrac;
% Densities and zFractions from Hammerstien
roW = 1;
roL = 0.92;
zFracWater = [0.111898    0.000000000 0.888102];
zFracLipid = [0.121690809 0.766868267 0.111440924];

density = Wfrac * roW + Lfrac * roL;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Wfrac .* roW * zFracWater + Lfrac .* roL .* zFracLipid;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

disp(Wfrac);
tissueComp = {'WaterAndLipid', density, [1, 6, 8], zFracs};
