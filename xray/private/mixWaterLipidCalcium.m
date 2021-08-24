function tissueComp = mixWaterLipidCalcium( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% Expected input string of the form 'Water##Lipid##Calcium##' where the
% numbers give the percent of that material in the mixture.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Lipid', 0.92, [1,6,8], [0.121690809 0.766868267 0.111440924]}
% {'Ca', 1.55, [20], [1]}

% frac_W = str2double( inputString( [6,7] ) ) / 100;
% frac_L = str2double( inputString( [13,14] ) ) / 100;
% frac_C = str2double( inputString( [22,23] ) ) / 100;


numInputs = sscanf(inputString, 'Water%fLipid%fCalcium%f');
frac_W = numInputs(1) / 100;
frac_L = numInputs(2) / 100;
frac_C = numInputs(3) / 100;

if abs( 1-(frac_W + frac_L + frac_C) ) > 1e-3
    error('Material fractions do not sum to unity.');
end

% Densities and zFractions from Hammerstien
density_W = 1;
density_L = 0.92;
density_C = 1.55;

% elements with z values [1, 6, 8, 20]
zFrac_W = [0.111898    0.000000000 0.888102    0.0000000];
zFrac_L = [0.121690809 0.766868267 0.111440924 0.0000000];
zFrac_C = [0.000000000 0.000000000 0.000000000 1.0000000];

density = frac_W * density_W + frac_L * density_L + frac_C * density_C;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = frac_W * density_W * zFrac_W + frac_L * density_L * zFrac_L + frac_C * density_C * zFrac_C;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {inputString, density, [1, 6, 8, 20], zFracs};
