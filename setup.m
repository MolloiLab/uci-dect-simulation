base_directory = 'C:\Users\smalk\OneDrive\Desktop\MOLLOI\MATLAB-DECT_SIMULATION\';

% add base_directory to path so that we don't have to stay in this folder
% to run the CT Simulation
addpath(base_directory);
% add paths for relevent library directories
addpath(strcat(base_directory, 'xray'));
addpath(strcat(base_directory, 'phantom_tiffs'));
% add path for the OO code as well
addpath(genpath(strcat(base_directory, 'OOP')));

% add path for astra toolbox
addpath(genpath(strcat(base_directory, 'astra-1.6')));

addpath(genpath(strcat(base_directory, 'prebuiltSimulators')));

% run('irt\setup.m');

% set up astra as well
% run('astra-1.6\setup.m');
