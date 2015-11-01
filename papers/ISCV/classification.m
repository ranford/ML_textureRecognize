
%% load the database
clear; close all;
clear options;





path_to_db = '/home/cw2189/ML_project/database_try';
src = curet_src(path_to_db);


Nim=128;%TODO waiting for filters to be appliccable for non-dyadic sizes
copts.renorm_process=0;
copts.l2_renorm=1;
foptions.J=7;
foptions.L=8;
soptions.M=1;
[Wop1,filters]=wavelet_factory_2d([Nim Nim], foptions, soptions);
soptions.M=2;
[Wop2,filters]=wavelet_factory_2d([Nim Nim], foptions, soptions);

features1{1} = @(x)(sum(sum(format_scat(scat(x,Wop1)),2),3));
features2{1} = @(x)(sum(sum(format_scat(scat(x,Wop2)),2),3));


options.parallel = 0;
db1 = prepare_database(src, features1, options);
db2 = prepare_database(src, features2, options);

% proportion of training example
prop = 0.5;
% split between training and testing
[train_set, test_set] = create_partition(src, prop);
% dimension of the affine pca classifier
train_opt.dim = 61;
% training
model1 = affine_train(db1, train_set, train_opt);
model2 = affine_train(db2, train_set, train_opt);
% testing
labels1 = affine_test(db1, model1, test_set);
labels2 = affine_test(db2, model2, test_set);

% compute the error
error1 = classif_err(labels1, test_set, src);
error2 = classif_err(labels2, test_set, src);

