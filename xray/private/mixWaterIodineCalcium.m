function tissueComp = mixWaterIodineCalcium( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% Expected input string of the form 'Water##Lipid##Calcium##' where the
% numbers give the percent of that material in the mixture.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Iodine', 4.933, [53], [1]}
% {'Ca', 1.55, [20], [1]}

% frac_W = str2double( inputString( [6,7] ) ) / 100;
% frac_I = str2double( inputString( [14,15] ) ) / 100;
% frac_C = str2double( inputString( [23,24] ) ) / 100;

numInputs = sscanf(inputString, 'Water%fIodine%fCalcium%f');
frac_W = numInputs(1) / 100;
frac_I = numInputs(2) / 100;
frac_C = numInputs(3) / 100;

if abs( 1-(frac_W + frac_I + frac_C) ) > 1e-3
    error('Material fractions do not sum to unity.');
end

% Densities and zFractions from Hammerstien
density_W = 1;
density_I = 4.933;
density_C = 1.55;

% elements with z values [1, 8, 20, 53]
zFrac_W = [0.111898    0.888102    0.000000000 0.0000000];
zFrac_I = [0.000000000 0.000000000 0.000000000 1.0000000];
zFrac_C = [0.000000000 0.000000000 1.000000000 0.0000000];

density = frac_W * density_W + frac_I * density_I + frac_C * density_C;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = frac_W * density_W * zFrac_W + frac_I * density_I * zFrac_I + frac_C * density_C * zFrac_C;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {inputString, density, [1, 8, 20, 53], zFracs};
