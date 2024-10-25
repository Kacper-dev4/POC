clc;
close all;
clear all;

% Wczytanie obrazów
image1 = imread("lenna_512x512.bmp");
image2 = imread("boat_512x512.bmp");

% Filtracja obrazu maską 1x3
mask_1x3 = [1; 1; 1];
filtered_image1_1x3 = apply_filter(image1, mask_1x3);
filtered_image2_1x3 = apply_filter(image2, mask_1x3);

% Filtracja obrazu maską 5x7
mask_5x7 = [-1,-1,-1;-1,9,-1;-1,-1,-1];
%mask_5x7 = [1 1 1 1 1 1 1;
%            1 1 1 2 1 1 1;
 %           1 1 2 3 2 1 1;
  %          1 1 1 2 1 1 1;
   %         1 1 1 1 1 1 1];
filtered_image1_5x7 = apply_filter(image1, mask_5x7);
filtered_image2_5x7 = apply_filter(image2, mask_5x7);

% Przycięcie przetworzonych obrazów do podanych rozmiarów
cropped_size1 = [455, 501];
cropped_size2 = [496, 511];

cropped_1x3_img1 = crop_to_size(filtered_image1_1x3, cropped_size1);
cropped_5x7_img1 = crop_to_size(filtered_image1_5x7, cropped_size2);
cropped_1x3_img2 = crop_to_size(filtered_image2_1x3, cropped_size1);
cropped_5x7_img2 = crop_to_size(filtered_image2_5x7, cropped_size2);

% Wyświetlenie obrazów w jednym subplocie
figure;

% Obraz 1
subplot(2, 3, 1);
imshow(image1);
title({'Obraz 1 oryginalny', ['Rozmiar: ', num2str(size(image1, 1)), ' x ', num2str(size(image1, 2))]});

subplot(2, 3, 2);
imshow(cropped_1x3_img1, []);
title({'Obraz 1 po filtracji 1x3', ['Rozmiar: ', num2str(size(cropped_1x3_img1, 1)), ' x ', num2str(size(cropped_1x3_img1, 2))]});

subplot(2, 3, 3);
imshow(cropped_5x7_img1, []);
title({'Obraz 1 po filtracji 5x7', ['Rozmiar: ', num2str(size(cropped_5x7_img1, 1)), ' x ', num2str(size(cropped_5x7_img1, 2))]});

% Obraz 2
subplot(2, 3, 4);
imshow(image2);
title({'Obraz 2 oryginalny', ['Rozmiar: ', num2str(size(image2, 1)), ' x ', num2str(size(image2, 2))]});

subplot(2, 3, 5);
imshow(cropped_1x3_img2, []);
title({'Obraz 2 po filtracji 1x3', ['Rozmiar: ', num2str(size(cropped_1x3_img2, 1)), ' x ', num2str(size(cropped_1x3_img2, 2))]});

subplot(2, 3, 6);
imshow(cropped_5x7_img2, []);
title({'Obraz 2 po filtracji 5x7', ['Rozmiar: ', num2str(size(cropped_5x7_img2, 1)), ' x ', num2str(size(cropped_5x7_img2, 2))]});

function output_image = apply_filter(input_image, mask)
    [rows, cols] = size(input_image);
    output_image = zeros(rows, cols);
    mask = mask / sum(mask(:));

    [mask_rows, mask_cols] = size(mask);
    half_mask_rows = floor(mask_rows / 2);
    half_mask_cols = floor(mask_cols / 2);

    for r = 1:rows
        for c = 1:cols
            region = get_region(input_image, r, c, half_mask_rows, half_mask_cols);
            output_image(r, c) = sum(region(:) .* mask(:));
        end
    end
end

function region = get_region(image, row, col, half_rows, half_cols)
    [max_rows, max_cols] = size(image);
    row_start = max(1, row - half_rows);
    row_end = min(max_rows, row + half_rows);
    col_start = max(1, col - half_cols);
    col_end = min(max_cols, col + half_cols);

    region = zeros(2 * half_rows + 1, 2 * half_cols + 1);
    region(1:(row_end-row_start+1), 1:(col_end-col_start+1)) = image(row_start:row_end, col_start:col_end);
end

function cropped_image = crop_to_size(filtered_image, target_size)
    [rows, cols] = size(filtered_image);
    start_row = floor((rows - target_size(1)) / 2) + 1;
    end_row = start_row + target_size(1) - 1;
    start_col = floor((cols - target_size(2)) / 2) + 1;
    end_col = start_col + target_size(2) - 1;

    cropped_image = filtered_image(start_row:end_row, start_col:end_col);
end