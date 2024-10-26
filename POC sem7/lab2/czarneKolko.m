function [img] = czarneKolko(radius)
   
    % Parametry obrazu
img_size = 512;
%radius = img_size / 4; % promień koła

% Tworzenie siatki współrzędnych
[x, y] = meshgrid(1:img_size, 1:img_size);

% Obliczanie odległości od środka
center = img_size / 2;
distance_from_center = sqrt((x - center).^2 + (y - center).^2);

% Tworzenie obrazu z jedynkami i zerami w kształcie koła
img = ones(img_size);
img(distance_from_center <= radius) = 0;

% Wyświetlanie obrazu
%imshow(img);



end