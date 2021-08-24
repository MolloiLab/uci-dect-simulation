function tissueComp = mixGlandAndAdip( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% inputString is expected to be like 'GlandAndAdip07 or GlandAndAdip56'
% where the last two numbers give the volume fraction of glandular tissue
% in the desired composite tissue.
% 
% Outputs a cell array describing the characteristics of the material.

% {'Hammerstein Glandular',1.04,[1, 6, 7, 8, 16],...
%     [0.102, 0.184, 0.032, 0.677, 0.005]},... 
%     
% {'Hammerstein Adipose',0.93,[1, 6, 7, 8, 16],...
%     [0.112, 0.619, 0.017, 0.251, 0.001]},...
%
% Gfrac = str2double( inputString( end-3 : end ) ) / 100;

Gfrac = sscanf(inputString, 'GlandAndAdip%f' )/100;
if Gfrac >1
    error('Fraction of glandular cannot exceed 1')
end

Afrac = 1 - Gfrac;
% Densities and zFractions from Hammerstien
roG = 1.04;
roA = 0.93;
zFracGland = [0.102, 0.184, 0.032, 0.677, 0.005];
zFracAdip  = [0.112, 0.619, 0.017, 0.251, 0.001];

density = Gfrac * roG + Afrac * roA;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the material
zFracs = Gfrac * roG * zFracGland + Afrac * roA * zFracAdip;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {'GlandAndAdip', density, [1, 6, 7, 8, 16], zFracs};
