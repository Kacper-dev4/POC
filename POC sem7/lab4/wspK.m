function [k] = wspK(img)

img = imbinarize(img);

dane = regionprops(img,'Area','Perimeter');

S = dane.Area;
L = dane.Perimeter;

k = (4*pi*S) / (L^2);

end

