%Usage
%    src = curet_src(directory)
%
% Input
%    directory: The directory containing the FMD Texture dataset.
%
% Output
%    src: The curet source.
%
% Note


function src = curet_src(directory)
        if nargin<1
                directory = '';
        end
        src = create_src(directory, @uiuc_extract_objects_fun);
end

function [objects, classes] = uiuc_extract_objects_fun(file)
        objects.u1 = [1, 1];
        objects.u2 = [200, 200];
        path_str = fileparts(file);
        path_parts = regexp(path_str, filesep, 'split');
        classes = {path_parts{end}};
end

