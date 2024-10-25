function output = bliz_chat(image, scale)
    % Pobranie wymiarów obrazka wejściowego
    [rows, cols, channels] = size(image);
    
    % Obliczenie nowych wymiarów obrazka po skalowaniu
    new_rows = round(rows * scale);
    new_cols = round(cols * scale);
    
    % Inicjalizacja obrazka wynikowego
    output = uint8(zeros(new_rows, new_cols, channels));
    
    % Obliczenie współczynników skalowania dla wierszy i kolumn
    scale_rows = rows / new_rows;
    scale_cols = cols / new_cols;
    
    % Iteracja po każdym pikselu obrazka wynikowego
    for i = 1:new_rows
        for j = 1:new_cols
            % Znalezienie odpowiadającego piksela w oryginalnym obrazie
            original_row = round(i * scale_rows);
            original_col = round(j * scale_cols);
            
            % Ochrona przed wyjściem poza granice obrazka
            original_row = min(max(original_row, 1), rows);
            original_col = min(max(original_col, 1), cols);
            
            % Przypisanie wartości piksela obrazka wynikowego
            output(i, j, :) = image(original_row, original_col, :);
        end
    end
end
