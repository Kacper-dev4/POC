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

prog1 = 180;
prog2 = 107;

Rk1 = binaryzacja(img1,prog1);
Rk2 = binaryzacja(img2,prog2);

[L1,liczbaObszarowRk1] = bwlabel(Rk1);
[L2,liczbaObszarowRk2] = bwlabel(Rk2);

pscolorRk1 = label2rgb(L1, 'jet', 'w', 'shuffle'); 
pscolorRk2 = label2rgb(L2, 'jet', 'w', 'shuffle');

poka1(img1,hist1,Rk1,prog1, pscolorRk1, liczbaObszarowRk1);
poka1(img2,hist2,Rk2,prog2, pscolorRk2, liczbaObszarowRk2);





