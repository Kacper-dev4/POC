function [C1, C2] = wspKolo(img)

img = imbinarize(img);

dane = regionprops(img,'Area','Perimeter');

S = dane.Area;
L = dane.Perimeter;

C1 = 2 * sqrt(S/pi);

C2 = L/pi;

end

