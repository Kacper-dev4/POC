function y = ciach(x, t)
    % Rozmiar wejściowego obrazu
    [w, k] = size(x);

    % Znajdź minimalną i maksymalną wartość w obrazie
    a = double(min(x(:)));
    b = double(max(x(:)));

    % Policz wystąpienia każdej wartości w obrazie
    pixel_counts = histcounts(x, a:b+1);

    % Znajdź wartości pikseli, które występują częściej niż t
    valid_pixels = find(pixel_counts > t);

    % Utwórz maskę dla pikseli do usunięcia (ustawienia na wartość a)
    mask = ~ismember(x, valid_pixels);

    % Ustaw piksele do usunięcia na wartość a
    x(mask) = 0;

    % Znajdź nowe minimalne i maksymalne wartości po usunięciu pikseli
    a_t = double(min(x(x>0)))
    b_t = double(max(x(:)))

    % Inicjalizuj wynikowy obraz
    y = zeros(w, k);


    for i = 1:w
        for j = 1:k
            y(i, j) = ((255.0 - 0.0) / double(b_t - a_t)) * (x(i, j) - a_t) + 0.0;
        end
    end

    % Konwertuj wynikowy obraz do uint8
    y = uint8(y);
end



