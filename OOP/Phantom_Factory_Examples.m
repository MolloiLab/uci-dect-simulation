% Phantom Factory Example
%
% This script gives examples of how to create Phantom objects and save them
% into .mat files to be loaded in a complete CT Simulation.

Phantom = IndexedImagePhantom();
Phantom.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantom_tiffs\test_small.tif');
Phantom.indexed_values = [255, 400, 800];
Phantom.material_list = {'Hammerstein Adipose', 'Hammerstein Glandular', 'Ca'};

Phantom.element_size = [0.25, 0.25];

%% Creation of the QRM chest phantom... phantom, i.e. the thorax phantom

Phantom = IndexedImagePhantom();
Phantom.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantom_tiffs\thorax_larger_circles_Cas.tif');
Phantom.indexed_values = [80, 90, 100, 150,...
                          121, 122, 123, 124, 125, 126, 127, 128];
Phantom.material_list = {'Air, Dry (near sea level)', 'Lung (LN300)', 'Striated Muscle', 'Bone, Cortical (ICRU-44)',...
                         'Water', 'WaterAndLipid80','WaterAndLipid60','WaterAndLipid40','WaterAndLipid20', 'Lipid', 'WaterAndCa95', 'Ca'};

Phantom.element_size = [0.04, 0.04];

%% Thorax validation phantom
% This is the thorax phantom with many small circles laid out in a grid in
% the heart region. Each circle has a different mixture of WLP

Phantom = IndexedImagePhantom();
Phantom.indexed_image = TiffStackRead('D:\Workbench\CTSimulator_New\phantom_tiffs\thorax_original.tif');
Phantom.indexed_values = [80, 90, 100, 150,... Background materials
                          110, 111, 112, 113, 114, 115,... Water - Lipid Mixtures
                          116, 117, 118, 119, 120, 121,... Water - Ca Mixtures, Lipid - Ca Mixtures
                          122, 123, 124, 125, 126, 127,... Water - Lipid - Ca Mixtures
                         ];
Phantom.material_list = {'Air, Dry (near sea level)', 'Lung (LN300)', 'Striated Muscle', 'Bone, Cortical (ICRU-44)',...
                         'Water', 'WaterAndLipid80','WaterAndLipid60','WaterAndLipid40','WaterAndLipid20', 'Lipid',...
                         'WaterAndCa99', 'WaterAndCa95', 'WaterAndCa90', 'LipidAndCa99', 'LipidAndCa95', 'LipidAndCa90',...
                         'Water70Lipid20Calcium10', 'Water60Lipid30Calcium10', 'Water50Lipid40Calcium10', 'Water40Lipid50Calcium10', 'Water30Lipid60Calcium10', 'Water20Lipid70Calcium10' 
                         };

Phantom.element_size = [0.04, 0.04];
