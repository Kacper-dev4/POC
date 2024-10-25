function output = chat_bili(image, scale)
    % Pobranie wymiarów obrazka wejściowego
    [rows, cols, channels] = size(image);
    
    % Obliczenie nowych wymiarów obrazka po skalowaniu
    new_rows = round(rows * scale);
    new_cols = round(cols * scale);
    
    % Inicjalizacja obrazka wynikowego
    output = uint8(zeros(new_rows, new_cols, channels));
    
    % Obliczenie współczynników skalowania dla wierszy i kolumn
    scale_rows = (rows - 1) / (new_rows - 1);
    scale_cols = (cols - 1) / (new_cols - 1);
    
    % Iteracja po każdym pikselu obrazka wynikowego
    for i = 1:new_rows
        for j = 1:new_cols
            % Obliczenie współrzędnych piksela w oryginalnym obrazie
            original_row = i * scale_rows;
            original_col = j * scale_cols;
            
            % Indeksy pikseli otaczających piksel w oryginalnym obrazie
            row_floor = floor(original_row);
            row_ceil = min(row_floor + 1, rows);
            col_floor = floor(original_col);
            col_ceil = min(col_floor + 1, cols);
            
            % Obliczenie wag pikseli otaczających
            weight_row_ceil = original_row - row_floor;
            weight_row_floor = 1 - weight_row_ceil;
            weight_col_ceil = original_col - col_floor;
            weight_col_floor = 1 - weight_col_ceil;
            
            % Interpolacja wartości piksela dla każdego kanału
            for k = 1:channels
                % Interpolacja w pionie
                top_left = weight_row_floor * image(row_floor, col_floor, k);
                top_right = weight_row_floor * image(row_floor, col_ceil, k);
                bottom_left = weight_row_ceil * image(row_ceil, col_floor, k);
                bottom_right = weight_row_ceil * image(row_ceil, col_ceil, k);
                
                % Interpolacja w poziomie
                top = weight_col_floor * top_left + weight_col_ceil * top_right;
                bottom = weight_col_floor * bottom_left + weight_col_ceil * bottom_right;
                
                % Ustawienie wartości piksela w obrazie wynikowym
                output(i, j, k) = round(weight_row_ceil * bottom + weight_row_floor * top);
            end
        end
    end
end
