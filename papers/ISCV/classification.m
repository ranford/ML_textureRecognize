
%% load the database
clear; close all;
clear options;





path_to_db = '/home/cw2189/ML_Project/database/curetgrey';
src = curet_src(path_to_db);
db_name = 'curet';
nb_split = 61;


Nim=128;%TODO waiting for filters to be appliccable for non-dyadic sizes
copts.renorm_process=0;
copts.l2_renorm=1;
foptions.J=7;
foptions.L=8;
soptions.M=2;
[Wop,filters]=wavelet_factory_2d([Nim Nim], foptions, soptions);


features{1} = @(x)(sum(sum(format_scat(scat(x,Wop)),2),3));

options.parallel = 0;
db = prepare_database(src, features, options);

% proportion of training example
prop = 0.5;
% split between training and testing
[train_set, test_set] = create_partition(src, prop);
% dimension of the affine pca classifier
train_opt.dim = 61;
% training
model = affine_train(db, train_set, train_opt);
% testing
labels = affine_test(db, model, test_set);
% compute the error
error = classif_err(labels, test_set, src);
