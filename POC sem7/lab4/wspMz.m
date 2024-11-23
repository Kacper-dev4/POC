function [Mz] = wspMz(img)

img = imbinarize(img);

dane = regionprops(img,'Area','Perimeter');

S = dane.Area;
L = dane.Perimeter;

Mz = (2*sqrt(pi*S))/ L;

end


