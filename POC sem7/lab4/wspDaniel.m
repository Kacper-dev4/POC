function [BB] = wspDaniel(img)

% Współczynnik Danielssona

img = imbinarize(img);

dane = regionprops(img,'Area');

S = dane.Area;

perimeterImage = bwperim(img);
[perimeterY, perimeterX] = find(perimeterImage);
[objectY, objectX] = find(img);
li = zeros(length(objectY), 1);
for i = 1:length(objectY)
    li(i) = min(sqrt((objectX(i) - perimeterX).^2 + (objectY(i) - perimeterY).^2));
end

li2 = li.^2;
Eli2 = sum(li2);
BB = S^3 / sqrt(Eli2);


end

