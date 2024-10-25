close all
clear all
img1 = imread("Ex1.png");

% Zadanie 1

%%%%%%%%%%%%%% Zestawienie 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,3,1)
[k1_img, k2_img, k3_img, k4_img] = ocen(img1);
%figure
subplot(2,3,4)
imhist(img1)
axis tight;

roz = rozciag(img1);
%figure
subplot(2,3,2)
[k1_roz, k2_roz, k3_roz, k4_roz] = ocen(roz);
%figure
subplot(2,3,5)
imhist(roz)
axis tight;

he = histeq(img1);

%figure
subplot(2,3,3)
[k1_he, k2_he, k3_he, k4_he] = ocen(he);

%figure
subplot(2,3,6)
imhist(he)
axis tight;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zestawienie 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

img1bw = img1;
img1bw(1,1) = 255;

figure
subplot(2,3,1)
ocen(img1bw)

%figure
subplot(2,3,4)
imhist(img1bw)
axis tight;
%rozbw = rozciag(img1bw);
%ocen(rozbw);

%ciach1 = roz_ciach(img1bw,200,10);
ciach1 = ciach2(img1bw,0.001);
%figure
subplot(2,3,2)
[k1_ciach, k2_ciach, k3_ciach, k4_ciach] = ocen(ciach1);
%figure
subplot(2,3,5)
imhist(ciach1)
axis tight;

%ciach2 = roz_ciach(img1bw,190,5);
ciach3 = ciach2(img1bw,0.007);
%figure
subplot(2,3,3)
[k1_ciach2, k2_ciach2, k3_ciach2, k4_ciach2] = ocen(ciach3);

%figure
subplot(2,3,6)
imhist(ciach3)
axis tight;


% Zadanie 2

%%%%%%%%%%%%%%%%%%%%%% Zestawienie 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
subplot(2,3,1)
ocen(img1)
%figure
subplot(2,3,4)
imhist(img1)
axis tight;

roz = rozciag(img1);
%figure
subplot(2,3,2)
[k1_roz, k2_roz, k3_roz, k4_roz] = ocen(ciach1);
%figure
subplot(2,3,5)
imhist(roz)
axis tight;

lok = lokalna(img1,9);

%figure
subplot(2,3,3)
[k1_lok, k2_lok, k3_lok, k4_lok] = ocen(lok);

%figure
subplot(2,3,6)
imhist(lok)
axis tight;




%%%%%%%%%%%%%%%%%%%%%% Zestawienie 4 %%%%%%%%%%%%%%%%%%%%%%%%%%


figure
subplot(2,3,1)
ocen(img1)
%figure
subplot(2,3,4)
imhist(img1)
axis tight;

clahe1 = adapthisteq(img1,"ClipLimit",0.01);
%figure
subplot(2,3,2)
ocen(clahe1)
%figure
subplot(2,3,5)
imhist(clahe1)
axis tight;

clash2 = adapthisteq(img1,"ClipLimit",0.05);

%figure
subplot(2,3,3)
ocen(clash2)

%figure
subplot(2,3,6)
imhist(clash2)
axis tight;

%%%%%%%%%%%%%%%%%%%%



