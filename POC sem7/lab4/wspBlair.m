function [BB] = wspBlair(img)

% Współczynnik Blaira-Blissa

img = imbinarize(img);

dane = regionprops(img,'Area','Centroid', 'PixelList');

S = dane.Area;
centroid = dane.Centroid;
pixelList = dane.PixelList;
ri = sqrt((pixelList(:,1) - centroid(1)).^2 + (pixelList(:,2) - centroid(2)).^2);
ri2 = ri.^2;
Eri2 = sum(ri2);
 BB = S / sqrt(2*pi*Eri2);


end

