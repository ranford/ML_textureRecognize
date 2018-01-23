path_to_scatnet = fullfile(fileparts(mfilename('fullpath')),'src');

addpath(fullfile(path_to_scatnet, 'classification'));
addpath(fullfile(path_to_scatnet, 'convolution'));
addpath(fullfile(path_to_scatnet, 'core'));
addpath(genpath(fullfile(path_to_scatnet, 'demo')));
addpath(fullfile(path_to_scatnet, 'display'));
addpath(fullfile(path_to_scatnet, 'filters'));
addpath(fullfile(path_to_scatnet, 'filters/selesnick'));
addpath(fullfile(path_to_scatnet, 'utils'));
addpath(genpath(fullfile(path_to_scatnet, 'papers')));
addpath(fullfile(path_to_scatnet, 'scatutils'));
addpath(fullfile(path_to_scatnet, 'utils'));
addpath(fullfile(path_to_scatnet, 'reconstruction'));
addpath(genpath(fullfile(path_to_scatnet, 'database')));


clear path_to_scatnet;

