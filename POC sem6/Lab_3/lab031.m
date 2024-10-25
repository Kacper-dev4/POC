close all
clear all

obraz1 = imread('lena_512x512.bmp');
obraz2 = imread('05_512x512.bmp');
%figure
%imshow(obraz1);

%%%%%%%%%% ZAD 1 

% Obliczenie liczby unikalnych kolorów
tic;
liczba_kolorow1 = liczb_kolory(obraz1);
czas_1=toc;
tic;
liczba_kolorow2 = liczb_kolory(obraz2);
czas_2=toc;
% 
% czas_1 = num2str(czas_1);
% czas_2 = num2str(czas_2);
% liczba_kolorow1 = num2str(liczba_kolorow1);
% liczba_kolorow2 = num2str(liczba_kolorow2);

% figure
% subplot(1,2,1)
% imshow(obraz1)
% xlabel({'Liczba barw unik POCLab = 148702',['Liczba barw unik RGB skrypt =' liczba_kolorow1],['Czas =' czas_1 's']});
% subplot(1,2,2)
% imshow(obraz2)
% xlabel({'Liczba barw unik POCLab = 54450',['Liczba barw unik RGB skrypt =' liczba_kolorow2],['Czas =' czas_2 's']});

%%%%%%%%%% ZAD 2 
hsv1 = rgb2hsv(obraz1);
hsv2 = rgb2hsv(obraz2);
%  hsv1=uint8(hsv1 * 255);
%  hsv2=uint8(hsv2 * 255);
%imshow(hsv1)
%imwrite(hsv2,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/hsv2.png');
liczba_hsv1 = liczb_koloryHSV(hsv1);
liczba_hsv2 = liczb_koloryHSV(hsv2);
rgb_hsv1 = hsv2rgb(hsv1);
rgb_hsv2 = hsv2rgb(hsv2);
liczba_rgbhsv1 = liczb_koloryHSV(rgb_hsv1);
liczba_rgbhsv2 = liczb_koloryHSV(rgb_hsv2);
ostatnie = rgb2hsv(rgb_hsv1);
liczba_rgbhsv34423 = liczb_koloryHSV(ostatnie);
%imwrite(rgb_hsv1,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/png_hsv1.png');
opis1 = sprintf('Liczba barw unik RGB skrypt = %.0f \n Liczba barw unik HSV skrypt =  %.0f', liczba_kolorow1, liczba_hsv1);
opis2 = sprintf('Liczba barw unik RGB skrypt = %.0f \n Liczba barw unik HSV skrypt =  %.0f', liczba_kolorow1, liczba_rgbhsv1);
opis3 = sprintf('Liczba barw unik RGB skrypt = %.0f \n Liczba barw unik HSV skrypt =  %.0f', liczba_kolorow2, liczba_hsv2);
opis4 = sprintf('Liczba barw unik RGB skrypt = %.0f \n Liczba barw unik HSV skrypt =  %.0f', liczba_kolorow2, liczba_rgbhsv2);

figure 
subplot(1,4,1)
imshow(obraz1)
xlabel(opis1);
subplot(1,4,2)
imshow(rgb_hsv1)
xlabel(opis2);
subplot(1,4,3)
imshow(obraz2)
xlabel(opis3);
subplot(1,4,4)
imshow(rgb_hsv2)
xlabel(opis4);

% %%%%%%%%%% ZAD 3 

% % Kwantyzacja obrazów w RGB
% % Dla 256 barw RGB
% RGBkwant256 = kwanty_dla_rgb(obraz1, 8, 8, 4);
% RGBliczbakwant256 = liczb_kolory(RGBkwant256);
% %imwrite(rgbKwant256,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbkwan256.png');
% % Dla 128 barw RGB
% RGBkwant128 = kwanty_dla_rgb(obraz1, 4, 6, 4);
% RGBliczbakwant128 = liczb_kolory(RGBkwant128);
% %imwrite(rgbKwant128,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbkwan128.png');
% % Dla 64 barw RGB
% RGBkwant64 = kwanty_dla_rgb(obraz1, 4, 4, 4);
% RGBliczbakwant64 = liczb_kolory(RGBkwant64);
% %imwrite(rgbKwant,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbkwan64.png');
% % Dla 8 barw RGB
% RGBkwant8 = kwanty_dla_rgb(obraz1, 2, 2, 2);
% RGBliczbakwant8 = liczb_kolory(RGBkwant8);
% %imwrite(rgbKwant8,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbkwan8.png');
% 
% psnr256 = psnr(RGBkwant256, obraz1);
% psnr128 = psnr(RGBkwant128,obraz1);
% psnr64 = psnr(RGBkwant64,obraz1);
% psnr8 = psnr(RGBkwant8,obraz1);
% 
% opis30 = sprintf('Liczba barw unik = %.0f', liczba_kolorow1);
% opis31 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', RGBliczbakwant256, psnr256);
% opis32 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', RGBliczbakwant128, psnr128);
% opis33 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', RGBliczbakwant64, psnr64);
% opis34 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', RGBliczbakwant8, psnr8);
% 
% figure
% subplot(1,5,1)
% imshow(obraz1);
% xlabel(opis30)
% subplot(1,5,2)
% imshow(RGBkwant256);
% xlabel(opis31)
% subplot(1,5,3)
% imshow(RGBkwant128);
% xlabel(opis32)
% subplot(1,5,4)
% imshow(RGBkwant64);
% xlabel(opis33)
% subplot(1,5,5)
% imshow(RGBkwant8);
% xlabel(opis34)

% %%%%%%%%%% ZAD 4
% hsv42 = rgb2hsv(obraz1);
% 
% HSVkwant256 = lowerHSV(hsv42, 10, 10, 5);
% HSVkwant256 = hsv2rgb(HSVkwant256)*255;
% HSVkwant256 = uint8(HSVkwant256);
% HSVliczbakwant256 = liczb_kolory(HSVkwant256);
% %rgbhsv256 = hsv2rgb(HSVkwant256);
% %imwrite(rgbhsv256,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbhsc256.png');
% HSVkwant128 = lowerHSV(hsv42, 4, 6, 4);
% HSVkwant128 = hsv2rgb(HSVkwant128)*255;
% HSVkwant128 = uint8(HSVkwant128);
% 
% HSVliczbakwant128 = liczb_kolory(HSVkwant128);
% 
% %rgbhsv128 = hsv2rgb(HSVkwant128);
% 
% HSVkwant64 = lowerHSV(hsv42, 4, 4, 4);
% HSVkwant64 = hsv2rgb(HSVkwant64)*255;
% HSVkwant64 = uint8(HSVkwant64);
% HSVliczbakwant64 = liczb_kolory(HSVkwant64);
% %rgbhsv64 = hsv2rgb(HSVkwant64);
% 
% HSVkwant8 = lowerHSV(hsv42, 2, 2, 2);
% HSVkwant8 = hsv2rgb(HSVkwant8)*255;
% HSVkwant8 = uint8(HSVkwant8);
% HSVliczbakwant8 = liczb_kolory(HSVkwant8);
% %rgbhsv8 = hsv2rgb(HVSkwant8);
% %imwrite(rgbhsv8,'C:/Users/Lilek/Desktop/Bazar/Studia/POC/Lab03/rgbhsc8.png');
% psnr256 = psnr(HSVkwant256, obraz1); % cos tu pozmieniac
% 
% psnr128 = psnr(HSVkwant128,obraz1);
% psnr64 = psnr(HSVkwant64,obraz1);
% psnr8 = psnr(HSVkwant8,obraz1);
% 
% opis30 = sprintf('Liczba barw unik = %.0f', liczba_kolorow1);
% opis31 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', HSVliczbakwant256, psnr256);
% opis32 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', HSVliczbakwant128, psnr128);
% opis33 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', HSVliczbakwant64, psnr64);
% opis34 = sprintf('Liczba barw unik = %.0f \n PSNR =  %.0f', HSVliczbakwant8, psnr8);
% 
% figure
% subplot(1,5,1)
% imshow(obraz1);
% xlabel(opis30)
% subplot(1,5,2)
% imshow(HSVkwant256);
% xlabel(opis31)
% subplot(1,5,3)
% imshow(HSVkwant128);
% xlabel(opis32)
% subplot(1,5,4)
% imshow(HSVkwant64);
% xlabel(opis33)
% subplot(1,5,5)
% imshow(HSVkwant8);
% xlabel(opis34)


function numColors = liczb_kolory(image)
    % Inicjalizacja tablicy na znaczniki unikalnych kolorów
    isColorPresent =  uint16(zeros(256, 256, 256));
    
    % Pobranie rozmiarów obrazu
    [height, width, ~] = size(image);

    % Iteracja przez piksele obrazu
    for i = 1:height
        for j = 1:width
            r = uint16(image(i, j, 1)) + 1 ;
            g = uint16(image(i, j, 2)) + 1 ;
            b = uint16(image(i, j, 3)) + 1 ;
            isColorPresent(r, g, b) = 1;
        end
    end

    % Zliczenie liczby unikalnych kolorów
    numColors = sum(isColorPresent(:));
end

function numColors = liczb_koloryHSV(image)
    % Inicjalizacja tablicy na znaczniki unikalnych kolorów
    isColorPresent =  uint16(zeros(256, 256, 256));
    
    % Pobranie rozmiarów obrazu
    [height, width, ~] = size(image);
   image = uint8(image*255);
    % Iteracja przez piksele obrazu
    for i = 1:height
        for j = 1:width
            r = uint16(image(i, j, 1)) + 1 ;
            g = uint16(image(i, j, 2)) + 1 ;
            b = uint16(image(i, j, 3)) + 1 ;
            isColorPresent(r, g, b) = 1;
        end
    end

    % Zliczenie liczby unikalnych kolorów
    numColors = sum(isColorPresent(:));
end


function B = kwanty_dla_rgb(A, r, g, b)
[y,x,z] = size(A);
B = ones(y,x,z, 'uint8');
for i = 1:y
    for j = 1:x
        B(i,j,1) = uint8(floor(double(A(i,j,1))/(256/r)) * (256/r) + (256/r/2));
        B(i,j,2) = uint8(floor(double(A(i,j,2))/(256/g)) * (256/g) + (256/g/2));
        B(i,j,3) = uint8(floor(double(A(i,j,3))/(256/b)) * (256/b) + (256/b/2));
    end
end
end

function returnHSV = lowerHSV(hsv, h, s, v)

returnHSV = hsv;

hsv(:, :, 1) = round(hsv(:, :, 1)*360);   %H
hsv(:, :, 2:3) = round(hsv(:, :, 2:3)*255);   %S,V

returnHSV(:, :, 1) = floor(hsv(:, :, 1)/floor(360/h))*floor(360/h) + floor(360/h/2);
returnHSV(:, :, 2) = floor(hsv(:, :, 2)/floor(255/s))*floor(255/s) + floor(255/s/2);  
returnHSV(:, :, 3) = floor(hsv(:, :, 3)/floor(255/v))*floor(255/v) + floor(255/v/2); 

returnHSV(:, :, 1) = returnHSV(:, :, 1)/360;
returnHSV(:, :, 2:3) = returnHSV(:, :, 2:3)/255;

end