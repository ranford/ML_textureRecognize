
function x = load_cudet(picture_path)

%    picture_path = '/home/cw2189/ML_Project/database/curetgrey';
    sample_list = dir(fullfile(picture_path,'sample*'));
    x = cell(1 , 5612);
%    [filename, pathname] = uigetfile('*.png', 'Pick an png file');
    for i = 1:length(sample_list),
        img_list = dir(fullfile(picture_path,sample_list(i).name,'*.png'));
            for j = 1:length(img_list),
                x{i*j} = imread(fullfile(picture_path,sample_list(i).name,img_list(j).name));
            end
    end
end

