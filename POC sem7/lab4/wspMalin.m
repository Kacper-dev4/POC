function [M] = wspMalin(img)

img = imbinarize(img);

dane = regionprops(img,'Area','Perimeter');

S = dane.Area;
L = dane.Perimeter;

M = L/(2*sqrt(pi*S)) - 1;

end

