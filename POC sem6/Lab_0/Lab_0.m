% 1a. 
 clear all
 close all
%szary = zeros(100,157);
war = 0; 
pop = war;
for i = 1:1:157
    for k=1:1:100
    szary(k,i) = war;
    war = war+1;
    end
    war = pop+1;
    pop = war;
end
img = mat2gray(szary); 
figure (1)
imshow(img)
% 1b.
img1 = imread('smok_1.jpg');
img2 = imread('smok_2.jpg');
gray1= rgb2gray(img1);
gray2= rgb2gray(img2);
figure (2)
subplot(1,5,1)
imshow(gray1);
subplot(1,5,2)
imshow(gray2);
suma_gray= gray1+gray2;
subplot(1,5,3)
imshow(suma_gray)
roznica_gray= gray1-gray2;
subplot(1,5,4)
imshow(roznica_gray)
mean_gray=suma_gray/2;
subplot(1,5,5)
imshow(mean_gray)
% 1c. 
img3 = imread('smok_rgb.jpg');
figure (3)
subplot(1,4,1)
imshow(img3)
R=img3(:,:,1);
G=img3(:,:,2);
B=img3(:,:,3);
subplot(1,4,2)
imshow(R)
subplot(1,4,3)
imshow(G)
subplot(1,4,4)
imshow(B)
% Stworzenie obrazów z pojedynczymi kanałami
czerwony = cat(3, R, zeros(size(R)), zeros(size(R)));
zielony = cat(3, zeros(size(G)), G, zeros(size(G)));
niebieski = cat(3, zeros(size(B)), zeros(size(B)), B);
figure (4)
subplot(1,4,1)
imshow(img3)
subplot(1,4,2)
imshow(czerwony)
subplot(1,4,3)
imshow(zielony)
subplot(1,4,4)
imshow(niebieski)
% %HSV
% HSV=rgb2hsv(img3);
% figure (5)
% subplot(1,4,1)
% imshow(HSV)
% 
% R=HSV(:,:,1);
% G=HSV(:,:,2);
% B=HSV(:,:,3);
% 
% subplot(1,4,2)
% imshow(R)
% 
% subplot(1,4,3)
% imshow(G)
% 
% subplot(1,4,4)
% imshow(B)
% 
% %Stworzenie obrazów z pojedynczymi kanałami
% czerwony = cat(3, R, zeros(size(R)), zeros(size(R)));
% zielony = cat(3, zeros(size(G)), G, zeros(size(G)));
% niebieski = cat(3, zeros(size(B)), zeros(size(B)), B);
% 
% figure (6)
% subplot(1,4,1)
% imshow(HSV)
% 
% subplot(1,4,2)
% imshow(czerwony)
% 
% subplot(1,4,3)
% imshow(zielony)
% 
% subplot(1,4,4)
% imshow(niebieski)
% % YCrCb
% YCrCb=rgb2ycbcr(img3);
% figure (7)
% subplot(1,4,1)
% imshow(YCrCb)
% 
% R=YCrCb(:,:,1);
% G=YCrCb(:,:,2);
% B=YCrCb(:,:,3);
% 
% subplot(1,4,2)
% imshow(R)
% 
% subplot(1,4,3)
% imshow(G)
% 
% subplot(1,4,4)
% imshow(B)
% 
% % Stworzenie obrazów z pojedynczymi kanałami
% czerwony = cat(3, R, zeros(size(R)), zeros(size(R)));
% zielony = cat(3, zeros(size(G)), G, zeros(size(G)));
% niebieski = cat(3, zeros(size(B)), zeros(size(B)), B);
% 
% figure (8)
% subplot(1,4,1)
% imshow(YCrCb)
% 
% subplot(1,4,2)
% imshow(czerwony)
% 
% subplot(1,4,3)
% imshow(zielony)
% 
% subplot(1,4,4)
% imshow(niebieski)
% 2a.
 img4=imread('kontrast.jpg');
 gray3=rgb2gray(img3);
 gray4=rgb2gray(img4);
 figure(9)
 subplot(3,2,1)
 imshow(gray1)
 subplot(3,2,2)
 imhist(gray1)
 subplot(3,2,3)
 imshow(gray4)
 subplot(3,2,4)
 imhist(gray4)
 subplot(3,2,5)
 imshow(gray3)
 subplot(3,2,6)
 imhist(gray3)
 % 2b.
img4s=imadjust(gray4);
img3s=imadjust(gray3);
figure (10)
subplot(2,2,1)
imshow(gray3)
subplot(2,2,2)
imshow(img3s)
subplot(2,2,3)
imhist(gray3)
subplot(2,2,4)
imhist(img3s)
figure (11)
subplot(2,2,1)
imshow(gray4)
subplot(2,2,2)
imshow(img4s)
subplot(2,2,3)
imhist(gray4)
subplot(2,2,4)
imhist(img4s)
% 2c.
img3e=histeq(gray3);
img4e=histeq(gray4);
figure (12)
subplot(2,3,1)
imshow(gray3)
subplot(2,3,2)
imshow(img3e)
subplot(2,3,3)
imshow(img3s)
subplot(2,3,4)
imhist(gray3)
subplot(2,3,5)
imhist(img3e)
subplot(2,3,6)
imhist(img3s)
figure (13)
subplot(2,3,1)
imshow(gray4)
subplot(2,3,2)
imshow(img4e)
subplot(2,3,3)
imshow(img4s)
subplot(2,3,4)
imhist(gray4)
subplot(2,3,5)
imhist(img4e)
subplot(2,3,6)
imhist(img4s)