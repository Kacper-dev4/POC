function [out,threshold] = binOtsu(img)

threshold = graythresh(img);
threshold = threshold *255;

out = binaryzacja(img,threshold);

end

