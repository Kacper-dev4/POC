function y = lokalna(x, b)




% Określ wymiary obrazka
[height, width, ~] = size(x);

% Zaokrąglij wymiary bloków do najbliższej liczby całkowitej
block_height = floor(height / 4);
block_width = floor(width / 4);

% Tworzenie wektorów określających rozmiary poszczególnych bloków, z uwzględnieniem pozostałych pikseli
rows = [block_height * ones(1, 3), height - block_height * 3];
cols = [block_width * ones(1, 3), width - block_width * 3];

% Podział obrazu na bloki
img_blocks = mat2cell(x, rows, cols, size(x, 3));


for i = 1:4
    for j = 1:4
        
        img_blocks{i, j} = ciach2(img_blocks{i, j},0.001);
    end
end

y = cell2mat(img_blocks);
end

