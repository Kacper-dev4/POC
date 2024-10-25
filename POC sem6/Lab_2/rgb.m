
function [red, green, blue] = rgb(input)
% Odczytaj rozmiar obrazu 
[rows, cols] = size(input);


red = uint8(zeros(rows,cols));
green = uint8(zeros(rows,cols));
blue = uint8(zeros(rows,cols));



% Zmiana na kolor czerwony
for i=1:2:rows
    for j = 1:2:cols
        red(i,j) = input(i,j);
    end
end


% Zmiana na kolor zielony
for i=1:2:rows
    for j = 1:2:cols
        green(i+1,j) = input(i+1,j);
        green(i,j+1) = input(i,j+1);
    end
end

% Zmiana na kolor niebieski
for i=1:2:rows
    for j = 1:2:cols
        blue(i+1,j+1) = input(i+1,j+1);
    end
end
end