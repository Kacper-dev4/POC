close all
clear all
% Zadanie 1

Lena = imread("lena_512x512.bmp");
O2 = imread("boat_512x512.bmp");
IV_Lena  =imread("FS_Lena.bmp");
IV_boat = imread("FS_boat.bmp");
szara = imread("lenna_szara_512x512.bmp");
dither = FS(szara);
dither2 = FS(O2);

thresh = graythresh(szara);
binarny_otsu = imbinarize(szara, thresh);
binarny_otsu = uint8(binarny_otsu)*255;

IV_Lena = uint8(IV_Lena)*255;

thresh2 = graythresh(O2);
binarny_otsu2 = imbinarize(O2,thresh2);
binarny_otsu2 = uint8(binarny_otsu2)*255;

IV_boat = uint8(IV_boat)*255;



font = 18;

szara = insertText(szara,[1 1],'Lena','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
binarny_otsu = insertText(binarny_otsu,[1 1],'Lena Otsu','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
dither = insertText(dither,[1 1],'Dithering FS','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_Lena = insertText(IV_Lena,[1 1],'Dithering FS2','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);

sklejka_Lena = [szara, binarny_otsu, dither,IV_Lena];

figure
subplot(1,4,1)
imshow(szara)

subplot(1,4,2)
imshow(binarny_otsu)

subplot(1,4,3)
imshow(dither)

subplot(1,4,4)
imshow(IV_Lena)

figure
imshow(sklejka_Lena)

O2 = insertText(O2,[1 1],'O2','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
binarny_otsu2 = insertText(binarny_otsu2,[1 1],'Lena Otsu','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
dither2 = insertText(dither2,[1 1],'Dithering FS','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_boat = insertText(IV_boat,[1 1],'Dithering FS2','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);


sklejka_O2 = [O2, binarny_otsu2,dither2,IV_boat];

figure
subplot(1,4,1)
imshow(O2)

subplot(1,4,2)
imshow(binarny_otsu2)

subplot(1,4,3)
imshow(dither2)

subplot(1,4,4)
imshow(IV_boat)


figure
imshow(sklejka_O2)

% Zadanie 2

% Lenka

Lena_16 = kwant(Lena,4,4,2);
%Lena_16_FS = FS_color(Lena,4,4,2);

Lena_16_FS = FS_lin(Lena,4);

%Lena_16_FS = FS_kolorki(Lena,16);
Lena_16_FS = uint8(Lena_16_FS * 255);
IV_lena_16=imread('lena_16.bmp');


Lena_256 = kwant(Lena,8,8,4);
%Lena_256_FS = FS_color(Lena,256,8,4);

%Lena_256_FS = FS_lin(Lena,256);

Lena_256_FS = FS_kolorki(Lena,256);
Lena_256_FS = uint8(Lena_256_FS * 255);
[cdata,colormap]=imread('lena_256.bmp');
IV_lena_256 = ind2rgb(cdata, colormap);
IV_lena_256 = im2uint8(IV_lena_256);
%IV_lena_16 = ind2rgb(cdata,colormap);
%imwrite(IV_lena_16,'lena_16.bmp');

caly_bialy = ones(512,512,3);
caly_bialy = im2uint8(caly_bialy);


Lena = insertText(Lena,[1 1],'Lena','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
Lena_16 = insertText(Lena_16,[1 1],'Lena 16 Bez FS','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
Lena_16_FS = insertText(Lena_16_FS,[1 1],'Lena FS 16','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_lena_16 = insertText(IV_lena_16,[1 1],'Lena FS 16 v2','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
Lena_256 = insertText(Lena_256,[1 1],'Lena 256 Bez FS','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
Lena_256_FS = insertText(Lena_256_FS,[1 1],'Lena FS 256','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_lena_256 = insertText(IV_lena_256,[1 1],'Lena FS 256 v2','FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);

zad2_lena = [Lena, Lena_16, Lena_16_FS, IV_lena_16; caly_bialy, Lena_256, Lena_256_FS, IV_lena_256];

figure
imshow(zad2_lena)

% Jakies drugie
O3 = imread('drzewo.jpg');
O3 = im2uint8(O3);
O3_16 = kwant(O3,4,2,2);
O3_16_FS = FS_color(O3,4,2,2);
%O3_16_FS = FS_kolorki(O3,16);
%O3_16_FS = uint8(O3_16_FS * 255);

[cdata2,colormap2]=imread('O3_16.png');
IV_O3_16 = ind2rgb(cdata2, colormap2);
IV_O3_16 = im2uint8(IV_O3_16);



O3_256 = kwant(O3,8,8,4);
O3_256_FS = FS_color(O3,8,8,4);
%O3_256_FS = FS_kolorki(O3,256);
%O3_256_FS = uint8(O3_256_FS * 255);

[cdata3,colormap3]=imread('O3_256.png');
IV_O3_256 = ind2rgb(cdata3, colormap3);
IV_O3_256 = im2uint8(IV_O3_256);

caly_bialy_O3 = ones(1817,1746,3);
caly_bialy_O3 = im2uint8(caly_bialy_O3);

font2 = 60;
O3 = insertText(O3,[1 1],'O3','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
O3_16 = insertText(O3_16,[1 1],'O3 16 Bez FS','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
O3_16_FS = insertText(O3_16_FS,[1 1],'O3 FS 16','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_O3_16 = insertText(IV_O3_16,[1 1],'O3 FS 16 v2','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
O3_256 = insertText(O3_256,[1 1],'O3 256 Bez FS','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
O3_256_FS = insertText(O3_256_FS,[1 1],'O3 FS 256','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
IV_O3_256 = insertText(IV_O3_256,[1 1],'O3 FS 256 v2','FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);



 zad2_O3 = [O3, O3_16, O3_16_FS, IV_O3_16; caly_bialy_O3, O3_256, O3_256_FS, IV_O3_256];
 figure
 imshow(zad2_O3);


% Zadanie 3 


psnr_Lena_16_bez = psnr(Lena_16,Lena);
psnr_Lena_16_FS = psnr(Lena_16_FS,Lena);
psnr_IV_lena_16 = psnr(IV_lena_16,Lena);
psnr_Lena_256_bez = psnr(Lena_256,Lena);
psnr_Lena_256_FS = psnr(Lena_256_FS,Lena);
psnr_IV_lena_256 = psnr(IV_lena_256,Lena);


psnr_O3_16_bez = psnr(O3_16,O3);
psnr_O3_16_FS = psnr(O3_16_FS,O3);
psnr_IV_O3_16 = psnr(IV_O3_16,O3);
psnr_O3_256_bez = psnr(O3_256,O3);
psnr_O3_256_FS = psnr(O3_256_FS,O3);
psnr_IV_O3_256 = psnr(IV_O3_256,O3);


description_Lena_16_bez = sprintf(' Kwantyzacja 16 barw bez ditheringu PSNR: %.2f',psnr_Lena_16_bez);
description_Lena_16_FS = sprintf(' Wynik ditheringu metoda wlasna 16 barw PSNR: %.2f',psnr_Lena_16_FS);
description_IV_lena_16 = sprintf(' Wynik ditheringu FS IrfanView PSNR: %.2f',psnr_IV_lena_16);
description_Lena_256_bez = sprintf('Kwantyzacja 256 barw bez ditheringu PSNR: %.2f',psnr_Lena_256_bez);
description_Lena_256_FC = sprintf(' Wynik ditheringu metoda wlasna 256 barw PSNR: %.2f',psnr_Lena_256_FS);
description_IV_lena_256 = sprintf(' Kwantyzacja 256 barw bez ditheringu PSNR: %.2f',psnr_IV_lena_256);

description_O3_16_bez = sprintf(' Kwantyzacja 16 barw bez ditheringu PSNR: %.2f',psnr_O3_16_bez);
description_O3_16_FS = sprintf(' Wynik ditheringu metoda wlasna 16 barw PSNR: %.2f',psnr_O3_16_FS);
description_IV_O3_16 = sprintf(' Wynik ditheringu FS IrfanView PSNR: %.2f',psnr_IV_O3_16);
description_O3_256_bez = sprintf('Kwantyzacja 256 barw bez ditheringu PSNR: %.2f',psnr_O3_256_bez);
description_O3_256_FC = sprintf(' Wynik ditheringu metoda wlasna 256 barw PSNR: %.2f',psnr_O3_256_FS);
description_IV_O3_256 = sprintf(' Kwantyzacja 256 barw bez ditheringu PSNR: %.2f',psnr_IV_O3_256);



 Lena_163 = insertText(Lena_16,[1 1],description_Lena_16_bez,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 Lena_16_FS3 = insertText(Lena_16_FS,[1 1],description_Lena_16_FS,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 IV_lena_163 = insertText(IV_lena_16,[1 1],description_IV_lena_16,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 Lena_2563 = insertText(Lena_256,[1 1],description_Lena_256_bez,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 Lena_256_FS3 = insertText(Lena_256_FS,[1 1],description_Lena_256_FC,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 IV_lena_2563 = insertText(IV_lena_256,[1 1],description_IV_lena_256,'FontSize',font,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);

zad3_lena = [Lena, Lena_163, Lena_16_FS3, IV_lena_163; caly_bialy, Lena_2563, Lena_256_FS3, IV_lena_2563];

figure
imshow(zad3_lena);


 O3_163 = insertText(O3_16,[1 1],description_O3_16_bez,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 O3_16_FS3 = insertText(O3_16_FS,[1 1],description_O3_16_FS,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 IV_O3_163 = insertText(IV_O3_16,[1 1],description_IV_O3_16,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 O3_2563 = insertText(O3_256,[1 1],description_O3_256_bez,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 O3_256_FS3 = insertText(O3_256_FS,[1 1],description_O3_256_FC,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);
 IV_O3_2563 = insertText(IV_O3_256,[1 1],description_IV_O3_256,'FontSize',font2,'TextColor', 'red', 'BoxColor', 'black', 'BoxOpacity', 1);


 zad3_O3 = [O3, O3_163, O3_16_FS3, IV_O3_163; caly_bialy_O3, O3_2563, O3_256_FS3, IV_O3_2563];

 figure
 imshow(zad3_O3);

