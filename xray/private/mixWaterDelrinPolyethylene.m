function tissueComp = mixWaterDelrinPolyethylene( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% Expected input string of the form 'Water##Delrin##Polyethylene##' where the
% numbers give the percent of that material in the mixture.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Delrin', 1.4101, [1,6,8],[0.0671, 0.4000, 0.5329]}
% {'Polyethylene', 0.93,[1 6],[0.143716 0.856284]}

% frac_W = str2double( inputString( [6,7] ) ) / 100;
% frac_D = str2double( inputString( [14,15] ) ) / 100;
% frac_P = str2double( inputString( [28,29] ) ) / 100;

numInputs = sscanf(inputString, 'Water%fDelrin%fPolyethylene%f');
frac_W = numInputs(1) / 100;
frac_D = numInputs(2) / 100;
frac_P = numInputs(3) / 100;

if abs( 1-(frac_W + frac_D + frac_P) ) > 1e-3
    error('Material fractions do not sum to unity.');
end

% Densities and zFractions from Hammerstien
density_W = 1;
density_D = 1.4101;
density_P = 0.93;

% elements with z values [1, 6, 8]
zFrac_W = [0.111898    0.000000000 0.888102];
zFrac_D = [0.0671      0.40000      0.5329];
zFrac_P = [0.143716    0.856284    0.00000];

density = frac_W * density_W + frac_D * density_D + frac_P * density_P;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = frac_W * density_W * zFrac_W + frac_D * density_D * zFrac_D + frac_P * density_P * zFrac_P;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {inputString, density, [1, 6, 8], zFracs};