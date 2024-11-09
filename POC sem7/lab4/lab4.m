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

%% Zadanie 1 %%%%%%%%%%%

hist1 = imhist(img1);
hist2 = imhist(img2);

T1 = 180;
T2 = 100;

Rk1 = binaryzacja(img1,T1);
Rk2 = binaryzacja(img2,T2);

[L1,liczbaObszarowRk1] = bwlabel(Rk1);
[L2,liczbaObszarowRk2] = bwlabel(Rk2);

pscolorRk1 = label2rgb(L1);%, 'jet', 'w', 'shuffle'); 
pscolorRk2 = label2rgb(L2);%, 'jet', 'w', 'shuffle');

%% Otsu
[Sk1,To1] = binOtsu(img1);
[Sk2,To2] = binOtsu(img2);

[L1otsu,liczbaObszarowSk1] = bwlabel(Sk1);
[L2otsu,liczbaObszarowSk2] = bwlabel(Sk2);

pscolorSk1 = label2rgb(L1otsu);%, 'jet', 'w', 'shuffle'); 
pscolorSk2 = label2rgb(L2otsu);%, 'jet', 'w', 'shuffle');

%% Wyświetlanie

poka1(img1,hist1,Rk1,T1, pscolorRk1, liczbaObszarowRk1,Sk1,To1, pscolorSk1, liczbaObszarowSk1);
poka1(img2,hist2,Rk2,T2, pscolorRk2, liczbaObszarowRk2,Sk2,To2, pscolorSk2, liczbaObszarowSk2);




%% Zadanie 3

Oz1 = imnoise(img1, 'salt & pepper', 0.02);
Oz2 = imnoise(img2, 'salt & pepper', 0.02);

histOz1 = imhist(Oz1);
histOz2 = imhist(Oz2);

Tz1 = 180;
Tz2 = 100;

progOz1 = binaryzacja(Oz1,Tz1);
progOz2 = binaryzacja(Oz2,Tz2);

[Lz1,Bz1] = bwlabel(progOz1);
[Lz2,Bz2] = bwlabel(progOz2);

pscolorOz1 = label2rgb(Lz1);%, 'jet', 'w', 'shuffle'); 
pscolorOz2 = label2rgb(Lz2);%, 'jet', 'w', 'shuffle');

Op1 = medfilt2(Oz1,[3,3]);
Op2 = medfilt2(Oz2,[3,3]);

histOp1 = imhist(Op1);
histOp2 = imhist(Op2);

Tp1 = 180;
Tp2 = 100;

progOp1 = binaryzacja(Op1,Tp1);
progOp2 = binaryzacja(Op2,Tp2);

[Lp1,Bp1] = bwlabel(progOp1);
[Lp2,Bp2] = bwlabel(progOp2);

pscolorOp1 = label2rgb(Lp1);%, 'jet', 'w', 'shuffle'); 
pscolorOp2 = label2rgb(Lp2);%, 'jet', 'w', 'shuffle');


poka3(img1,hist1,Rk1,pscolorRk1,T1,liczbaObszarowRk1,Oz1,histOz1,progOz1,pscolorOz1,Tz1,Bz1,Op1,histOp1,progOp1,pscolorOp1,Tp1,Bp1);
poka3(img2,hist2,Rk2,pscolorRk2,Tz2,liczbaObszarowRk2,Oz2,histOz2,progOz2,pscolorOz2,Tz2,Bz2,Op2,histOp2,progOp2,pscolorOp2,Tp2,Bp2);




