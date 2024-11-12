clear all 
clc

img1 = imread('Obrazy do segmentacji\20191121_072020.jpg'); %chrupki 
%img2 = imread('Obrazy do segmentacji\20191121_072334.jpg'); % kawa ? lub ekhem!? 
img2 = imread('tekst.jpg');

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

pscolorRk1 = label2rgb(L1, 'jet', 'w', 'shuffle'); 
pscolorRk2 = label2rgb(L2, 'jet', 'w', 'shuffle');

%%% Otsu
[Sk1,To1] = binOtsu(img1);
[Sk2,To2] = binOtsu(img2);

[L1otsu,liczbaObszarowSk1] = bwlabel(Sk1);
[L2otsu,liczbaObszarowSk2] = bwlabel(Sk2);

pscolorSk1 = label2rgb(L1otsu, 'jet', 'w', 'shuffle'); 
pscolorSk2 = label2rgb(L2otsu, 'jet', 'w', 'shuffle');

% Wyświetlanie

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

% [progOz1,Tz1] = binOtsu(Oz1);
% [progOz2,Tz2] = binOtsu(Oz2);

[Lz1,Bz1] = bwlabel(progOz1);
[Lz2,Bz2] = bwlabel(progOz2);

pscolorOz1 = label2rgb(Lz1, 'jet', 'w', 'shuffle'); 
pscolorOz2 = label2rgb(Lz2, 'jet', 'w', 'shuffle');

Op1 = medfilt2(Oz1,[3,3]);
Op2 = medfilt2(Oz2,[3,3]);

histOp1 = imhist(Op1);
histOp2 = imhist(Op2);

Tp1 = 180;
Tp2 = 100;

progOp1 = binaryzacja(Op1,Tp1);
progOp2 = binaryzacja(Op2,Tp2);

% [progOp1,Tp1] = binOtsu(Op1);
% [progOp2,Tp2] = binOtsu(Op2);


[Lp1,Bp1] = bwlabel(progOp1);
[Lp2,Bp2] = bwlabel(progOp2);

pscolorOp1 = label2rgb(Lp1, 'jet', 'w', 'shuffle'); 
pscolorOp2 = label2rgb(Lp2, 'jet', 'w', 'shuffle');


poka3(img1,hist1,Rk1,pscolorRk1,T1,liczbaObszarowRk1,Oz1,histOz1,progOz1,pscolorOz1,Tz1,Bz1,Op1,histOp1,progOp1,pscolorOp1,Tp1,Bp1);
poka3(img2,hist2,Rk2,pscolorRk2,T2,liczbaObszarowRk2,Oz2,histOz2,progOz2,pscolorOz2,Tz2,Bz2,Op2,histOp2,progOp2,pscolorOp2,Tp2,Bp2);

% poka3(img1,hist1,Sk1,pscolorSk1,To1,liczbaObszarowRk1,Oz1,histOz1,progOz1,pscolorOz1,Tz1,Bz1,Op1,histOp1,progOp1,pscolorOp1,Tp1,Bp1);
% poka3(img2,hist2,Sk2,pscolorSk2,To2,liczbaObszarowRk2,Oz2,histOz2,progOz2,pscolorOz2,Tz2,Bz2,Op2,histOp2,progOp2,pscolorOp2,Tp2,Bp2);
% 

% %% Zadanie 4
% 
% prze1 = imclose(Sk1,strel('disk',50));
% prze2 = imerode(prze1,strel('disk',20));
% 
% prze3 = imdilate(prze2,strel('disk',10));
% prze4 = imopen(prze3,strel('disk',10));
% 
% figure 
% subplot(1,5,1)
% imshow(Sk1)
% subplot(1,5,2)
% imshow(prze1)
% subplot(1,5,3)
% imshow(prze2)
% subplot(1,5,4)
% imshow(prze3)
% subplot(1,5,5)
% imshow(prze4)

%% Zadanie 4 
prze1 = imclose(Sk1,strel('disk',45));
%prze1 = imclose(Rk1,strel('disk',45));
prze2 = imopen(prze1,strel('disk',66));

%prze3 = imerode(prze2,strel('disk',25));
%prze4 = imdilate(prze3,strel('disk',25));


Bm(:,:,1) = prze1;
Bm(:,:,2) = prze2;
%Bm(:,:,3) = prze3;
%Bm(:,:,4) = prze4;

opisMi{1} = sprintf('Zamkniecia');
opisMi{2} = sprintf('Otwarcia');
%opisMi{3} = sprintf('Erozja');
%opisMi{4} = sprintf('Dylatacja');

[p1,LLp1]  = pseudoKolory(prze1);
[p2,LLp2]  = pseudoKolory(prze2);
%[p3,LLp3]  = pseudoKolory(prze3);
%[p4,LLp4]  = pseudoKolory(prze4);

pscolorBm(:,:,:,1) = p1; 
pscolorBm(:,:,:,2) = p2; 
%pscolorBm(:,:,:,3) = p3; 
%pscolorBm(:,:,:,4) = p4; 

liczbaObszarowBmi(1) = LLp1;
liczbaObszarowBmi(2) = LLp2;
%liczbaObszarowBmi(3) = LLp3;
%liczbaObszarowBmi(4) = LLp4;

poka4(img1,Sk1,pscolorSk1,liczbaObszarowSk1,To1,Bm,opisMi,pscolorBm,liczbaObszarowBmi)
%poka4(img1,Rk1,pscolorRk1,liczbaObszarowRk1,T1,Bm,opisMi,pscolorBm,liczbaObszarowBmi)

% prze1 = imclose(Sk1,strel('disk',45));
% %prze1 = imclose(Rk1,strel('disk',45));
% prze2 = imopen(prze1,strel('disk',10));
% 
% prze3 = imdilate(prze2,strel('disk',20));
% prze4 = imerode(prze3,strel('disk',25));

%% Chyba najlepsze

% prze1 = imclose(Sk1,strel('disk',45));
% %prze1 = imclose(Rk1,strel('disk',45));
% prze2 = imopen(prze1,strel('disk',66));
% 
% prze3 = imerode(prze2,strel('disk',25));
% prze4 = imdilate(prze3,strel('disk',25));

%% Gdyby nie otsu

%prze1 = imclose(Sk1,strel('disk',45));
prze1 = imopen(Rk1,strel('disk',10));
prze2 = imclose(prze1,strel('disk',20));

