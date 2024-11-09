function [out] = binaryzacja(img,T)

%img(img>=T) = 255;

img(img<T) = 255;
%img(img<T) = 0;
img(img>=T & img~=255) = 0;

out = logical(img);

end

