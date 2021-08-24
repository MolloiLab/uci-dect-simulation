function tissueComp = mixWaterLipidProtein( inputString )
% Creates a material that simluates a mix of glandular and adipose tissue.
%
% Expected input string of the form 'Water##Lipid##Protein##' where the
% numbers give the percent of that material in the mixture.

% {'Water',1,[1 8],[0.111898 0.888102]}
% {'Lipid', 0.92, [1,6,8], [0.121690809 0.766868267 0.111440924]}
% {'Protein', 1.35, [1,6,7,8,16], [0.070914697 0.531462668 0.161143807 0.226546897 0.009931932]}

% frac_W = str2double( inputString( [6,7] ) ) / 100;
% frac_L = str2double( inputString( [13,14] ) ) / 100;
% frac_P = str2double( inputString( [22,23] ) ) / 100;

numInputs = sscanf(inputString, 'Water%fLipid%fProtein%f');
frac_W = numInputs(1) / 100;
frac_L = numInputs(2) / 100;
frac_P = numInputs(3) / 100;

if abs( 1-(frac_W + frac_L + frac_P) ) > 1e-3
    error('Material fractions do not sum to unity.');
end

% Densities and zFractions from Hammerstien
density_W = 1;
density_L = 0.92;
density_P = 1.35;

% elements with z values [1, 6, 7, 8, 16]
zFrac_W = [0.111898    0.000000000 0.000000000 0.888102    0.0000000];
zFrac_L = [0.121690809 0.766868267 0.000000000 0.111440924 0.0000000];
zFrac_P = [0.070914697 0.531462668 0.161143807 0.226546897 0.009931932];

density = frac_W * density_W + frac_L * density_L + frac_P * density_P;

% The zFrac arrays give the mass fractions of each element.
% From the volume fraction, density, and mass fraction, here we calculate
% the mass of each element in the composite material
zFracs = frac_W * density_W * zFrac_W + frac_L * density_L * zFrac_L + frac_P * density_P * zFrac_P;
% Then we divide by the total mass to get mass fractions back
zFracs = zFracs / sum( zFracs(:) );

tissueComp = {inputString, density, [1, 6, 7, 8, 16], zFracs};