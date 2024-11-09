clear all 
clc

img1 = imread('Obrazy do segmentacji\20191121_072020.jpg'); %chrupki 
img2 = imread('Obrazy do segmentacji\20191121_072334.jpg'); % kawa ? lub ekhem!? 

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

% figure
% subplot(1,2,1)
% imshow(img1);
% title('img1');
% subplot(1,2,2)
% imshow(img2);
% title('img2');

%%%% Zadanie 1 %%%%%%%%%%%

hist1 = imhist(img1);
hist2 = imhist(img2);

T1 = 180;
T2 = 100;

Rk1 = binaryzacja(img1,T1);
Rk2 = binaryzacja(img2,T2);

[L1,liczbaObszarowRk1] = bwlabel(Rk1);
[L2,liczbaObszarowRk2] = bwlabel(Rk2);

pscolorRk1 = label2rgb(L1, 'jet', 'w', 'shuffle'); 
pscolorRk2 = label2rgb(L2, 'jet', 'w', 'shuffle');

%% Otsu
[Sk1,To1] = binOtsu(img1);
[Sk2,To2] = binOtsu(img2);

[L1otsu,liczbaObszarowSk1] = bwlabel(Sk1);
[L2otsu,liczbaObszarowSk2] = bwlabel(Sk2);

pscolorSk1 = label2rgb(L1otsu, 'jet', 'w', 'shuffle'); 
pscolorSk2 = label2rgb(L2otsu, 'jet', 'w', 'shuffle');

%% Wyświetlanie

poka1(img1,hist1,Rk1,T1, pscolorRk1, liczbaObszarowRk1,Sk1,To1, pscolorSk1, liczbaObszarowSk1);
poka1(img2,hist2,Rk2,T2, pscolorRk2, liczbaObszarowRk2,Sk2,To2, pscolorSk2, liczbaObszarowSk2);




