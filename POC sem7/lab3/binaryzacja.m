function [out] = binaryzacja(img,T)

img(img>=T) = 255;
img(img<T) = 0;

out = ~logical(img);

end

