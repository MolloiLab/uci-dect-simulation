function tissueComp = mixWaterAndDelrin( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'WaterAndLipid07 or WaterAndLipid56'
% where the last two numbers give the volume fraction of water in the
% desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Delrin', 1.4101, [1,6,8],[0.0671, 0.4000, 0.5329]}

% Wfrac = str2double( inputString( end-1 : end ) ) / 100;
Wfrac = sscanf(inputString,'WaterAndDelrin%f') / 100;
if Wfrac > 1
    error('Fraction of water cannot exceed 1')
end
Delrinfrac = 1 - Wfrac;
% Densities and zFractions from Hammerstien
roW = 1;
roDelrin = 1.4101;
zFracWater = [0.111898    0.0000000    0.888102 ];
zFracDelrin = [0.0671    0.4000   0.5329];

density = Wfrac * roW + Delrinfrac * roDelrin;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = Wfrac * roW * zFracWater + Delrinfrac * roDelrin * zFracDelrin;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'WaterAndDelrin', density, [1, 6, 8], zFracs};