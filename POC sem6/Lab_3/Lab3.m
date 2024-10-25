clear all
close all
% Liczenie

img1 = imread("lena_512x512.bmp");
img2 = imread("monarch_512x512.bmp");

% Pierwszy obrazek 
tic;
ile1 = licz(img1);
time_rgb1 = toc; 
hsv1= rgb2hsv(img1);

%hsv12 = uint8(hsv1*255); 
tic;
hsvile1=liczhsv(hsv1);
time_hsv1=toc;

o1_rgb = uint8(hsv2rgb(hsv1)*255);
o1_rgb_inne  = hsv2rgb(hsv1);

powrot1 = rgb2hsv(o1_rgb_inne);
powrot1_ile = liczhsv(powrot1);
tic;
ile_o1_rgb = licz(o1_rgb);
time_orgb1 = toc;

% Drugi obrazek

tic;
ile2 = licz(img2);
time_rgb2 = toc; 
hsv2= rgb2hsv(img2);

%hsv22 = uint8(hsv2*255); 
tic;
hsvile2=liczhsv(hsv2);
time_hsv2=toc;

o2_rgb = uint8(hsv2rgb(hsv2)*255);
o2_rgb_inne  = hsv2rgb(hsv2);

powrot2 = rgb2hsv(o2_rgb_inne);
powrot2_ile = liczhsv(powrot2);
tic;
ile_o2_rgb = licz(o2_rgb);
time_orgb2 = toc;

% Kwantyzacja

% Obrazek 1

o1_8barw =kwant(img1,2,2,2); 
ile_8barw =licz(o1_8barw);
psnr_8 = psnr(o1_8barw,img1);

o1_64barw =kwant(img1,4,4,4); 
ile_64barw =licz(o1_64barw);
psnr_64 = psnr(o1_64barw,img1);

o1_128barw =kwant(img1,6,6,4); 
ile_128barw =licz(o1_128barw);
psnr_128 = psnr(o1_128barw,img1);

o1_256barw =kwant(img1,8,8,4); 
ile_256barw =licz(o1_256barw);
psnr_256 = psnr(o1_256barw,img1);

% Obrazek 2

o2_8barw =kwant(img2,2,2,2); 
ile2_8barw =licz(o2_8barw);
psnr2_8 = psnr(o2_8barw,img2);

o2_64barw =kwant(img2,4,4,4); 
ile2_64barw =licz(o2_64barw);
psnr2_64 = psnr(o2_64barw,img2);

o2_128barw =kwant(img2,6,6,4); 
ile2_128barw =licz(o2_128barw);
psnr2_128 = psnr(o2_128barw,img2);

o2_256barw =kwant(img2,8,8,4); 
ile2_256barw =licz(o2_256barw);
psnr2_256 = psnr(o2_256barw,img2);

%  Kwantyzacja HSV

% Obrazek 1

h1_8barw =kwanthsv(hsv1,2,2,2); 
h1_8barw = (hsv2rgb(h1_8barw)*255);
h1_8barw = uint8(h1_8barw);
h1_ile_8barw =licz(h1_8barw);
h1_psnr_8 = psnr(h1_8barw,img1);

h1_64barw =kwanthsv(hsv1,4,4,4);
h1_64barw = hsv2rgb(h1_64barw)*255;
h1_64barw = uint8(h1_64barw);
h1_ile_64barw =licz(h1_64barw);
h1_psnr_64 = psnr(h1_64barw,img1);

h1_128barw =kwanthsv(hsv1,6,6,4);
h1_128barw = hsv2rgb(h1_128barw)*255;
h1_128barw = uint8(h1_128barw);
h1_ile_128barw =licz(h1_128barw);
h1_psnr_128 = psnr(h1_128barw,img1);

h1_256barw =kwanthsv(hsv1,10,10,5);
h1_256barw = hsv2rgb(h1_256barw)*255;
h1_256barw = uint8(h1_256barw);
h1_ile_256barw =licz(h1_256barw);
h1_psnr_256 = psnr(h1_256barw,img1);

% Obrazek 2

h2_8barw =kwanthsv(hsv2,2,2,2); 
h2_8barw = (hsv2rgb(h2_8barw)*255);
h2_8barw = uint8(h2_8barw);
h2_ile_8barw =licz(h2_8barw);
h2_psnr_8 = psnr(h2_8barw,img2);

h2_64barw =kwanthsv(hsv2,4,4,4);
h2_64barw = hsv2rgb(h2_64barw)*255;
h2_64barw = uint8(h2_64barw);
h2_ile_64barw =licz(h2_64barw);
h2_psnr_64 = psnr(h2_64barw,img2);

h2_128barw =kwanthsv(hsv2,6,6,4);
h2_128barw = hsv2rgb(h2_128barw)*255;
h2_128barw = uint8(h2_128barw);
h2_ile_128barw =licz(h2_128barw);
h2_psnr_128 = psnr(h2_128barw,img2);

h2_256barw =kwanthsv(hsv2,10,10,5);
h2_256barw = hsv2rgb(h2_256barw)*255;
h2_256barw = uint8(h2_256barw);
h2_ile_256barw =licz(h2_256barw);
h2_psnr_256 = psnr(h2_256barw,img2);





% Zadanie 1

napis_o1 = num2str(ile1);
napis_o2 = num2str(ile2);
napis_czas1 = num2str(time_rgb1);
napis_czas2 = num2str(time_rgb2);

figure

subplot(1,2,1)
imshow(img1);
xlabel({'Liczba barw unik POCLab = 148702',['Liczba barw unik RGB skrypt =' napis_o1],['Czas =' napis_czas1 's']});

subplot(1,2,2)
imshow(img2);
xlabel({'Liczba barw unik POCLab = 63967',['Liczba barw unik RGB skrypt =' napis_o2],['Czas =' napis_czas2 's']});

saveas(gcf, 'zadanie1.png');

% Zadanie 2
  napis_hsv1 = num2str(hsvile1);
  napis_hsv2 = num2str(hsvile2);

  napis_o1_rgb = num2str(ile_o1_rgb);
  napis_o2_rgb = num2str(ile_o2_rgb);
  
  napis_o1_inne = num2str(powrot1_ile);
  napis_o2_inne = num2str(powrot2_ile);

figure

subplot(1,4,1)
imshow(img1);
xlabel({['Liczba barw unik RGB skrypt =',napis_o1],['Liczba barw unik HSV skrypt =' napis_hsv1]})

subplot(1,4,2)
imshow(o1_rgb)
xlabel({['Liczba barw unik RGB skrypt =',napis_o1_rgb],['Liczba barw unik HSV skrypt =' napis_hsv1]}) % napis_o1_inne

subplot(1,4,3)
imshow(img2);
xlabel({['Liczba barw unik RGB skrypt =',napis_o2],['Liczba barw unik HSV skrypt =' napis_hsv2]})

subplot(1,4,4)
imshow(o2_rgb)
xlabel({['Liczba barw unik RGB skrypt =',napis_o2_rgb],['Liczba barw unik HSV skrypt =' napis_hsv2]}) % napis_o2_inne

% Zadanie 3

% Obrazek 1

napis_ile_8barw = num2str(ile_8barw);
napis_psnr_8 = num2str(psnr_8);

napis_ile_64barw = num2str(ile_64barw);
napis_psnr_64 = num2str(psnr_64);

napis_ile_128barw = num2str(ile_128barw);
napis_psnr_128 = num2str(psnr_128);

napis_ile_256barw = num2str(ile_256barw);
napis_psnr_256 = num2str(psnr_256);


figure

subplot(1,5,1)
imshow(img1);
xlabel(['Liczba barw unik =',napis_o1])

subplot(1,5,2)
imshow(o1_8barw);
xlabel({['Liczba barw unik =',napis_ile_8barw],['PSNR =' napis_psnr_8]})

subplot(1,5,3)
imshow(o1_64barw);
xlabel({['Liczba barw unik =',napis_ile_64barw],['PSNR =' napis_psnr_64]})

subplot(1,5,4)
imshow(o1_128barw);
xlabel({['Liczba barw unik =',napis_ile_128barw],['PSNR =' napis_psnr_128]})

subplot(1,5,5)
imshow(o1_256barw);
xlabel({['Liczba barw unik =',napis_ile_256barw],['PSNR =' napis_psnr_256]})


% Obrazek 2

napis_ile2_8barw = num2str(ile2_8barw);
napis_psnr2_8 = num2str(psnr2_8);

napis_ile2_64barw = num2str(ile2_64barw);
napis_psnr2_64 = num2str(psnr2_64);

napis_ile2_128barw = num2str(ile2_128barw);
napis_psnr2_128 = num2str(psnr2_128);

napis_ile2_256barw = num2str(ile2_256barw);
napis_psnr2_256 = num2str(psnr2_256);


figure

subplot(1,5,1)
imshow(img2);
xlabel(['Liczba barw unik =',napis_o2])

subplot(1,5,2)
imshow(o2_8barw);
xlabel({['Liczba barw unik =',napis_ile2_8barw],['PSNR =' napis_psnr2_8]})

subplot(1,5,3)
imshow(o2_64barw);
xlabel({['Liczba barw unik =',napis_ile2_64barw],['PSNR =' napis_psnr2_64]})

subplot(1,5,4)
imshow(o2_128barw);
xlabel({['Liczba barw unik =',napis_ile2_128barw],['PSNR =' napis_psnr2_128]})

subplot(1,5,5)
imshow(o2_256barw);
xlabel({['Liczba barw unik =',napis_ile2_256barw],['PSNR =' napis_psnr2_256]})


% Zadanie 4

% Obrazek 1

h1_napis_ile_8barw = num2str(h1_ile_8barw);
h1_napis_psnr_8 = num2str(h1_psnr_8);

h1_napis_ile_64barw = num2str(h1_ile_64barw);
h1_napis_psnr_64 = num2str(h1_psnr_64);

h1_napis_ile_128barw = num2str(h1_ile_128barw);
h1_napis_psnr_128 = num2str(h1_psnr_128);

h1_napis_ile_256barw = num2str(h1_ile_256barw);
h1_napis_psnr_256 = num2str(h1_psnr_256);


figure

subplot(1,5,1)
imshow(img1);
xlabel(['Liczba barw unik =',napis_o1])

subplot(1,5,2)
imshow(h1_8barw);
xlabel({['Liczba barw unik =',h1_napis_ile_8barw],['PSNR =' h1_napis_psnr_8]})

subplot(1,5,3)
imshow(h1_64barw);
xlabel({['Liczba barw unik =',h1_napis_ile_64barw],['PSNR =' h1_napis_psnr_64]})

subplot(1,5,4)
imshow(h1_128barw);
xlabel({['Liczba barw unik =',h1_napis_ile_128barw],['PSNR =' h1_napis_psnr_128]})

subplot(1,5,5)
imshow(h1_256barw);
xlabel({['Liczba barw unik =',h1_napis_ile_256barw],['PSNR =' h1_napis_psnr_256]})

% Obrazek 2 

h2_napis_ile_8barw = num2str(h2_ile_8barw);
h2_napis_psnr_8 = num2str(h2_psnr_8);

h2_napis_ile_64barw = num2str(h2_ile_64barw);
h2_napis_psnr_64 = num2str(h2_psnr_64);

h2_napis_ile_128barw = num2str(h2_ile_128barw);
h2_napis_psnr_128 = num2str(h2_psnr_128);

h2_napis_ile_256barw = num2str(h2_ile_256barw);
h2_napis_psnr_256 = num2str(h2_psnr_256);


figure

subplot(1,5,1)
imshow(img2);
xlabel(['Liczba barw unik =',napis_o2])

subplot(1,5,2)
imshow(h2_8barw);
xlabel({['Liczba barw unik =',h2_napis_ile_8barw],['PSNR =' h2_napis_psnr_8]})

subplot(1,5,3)
imshow(h2_64barw);
xlabel({['Liczba barw unik =',h2_napis_ile_64barw],['PSNR =' h2_napis_psnr_64]})

subplot(1,5,4)
imshow(h2_128barw);
xlabel({['Liczba barw unik =',h2_napis_ile_128barw],['PSNR =' h2_napis_psnr_128]})

subplot(1,5,5)
imshow(h2_256barw);
xlabel({['Liczba barw unik =',h2_napis_ile_256barw],['PSNR =' h2_napis_psnr_256]})





%ile_hsv = hsvpolicz(hsv);
% hsv = rgb2hsv(img1);
% 
% hsv(:,:,1) = hsv(:,:,1)*360;
% 
% hsv(:,:,1) = uint16(hsv(:,:,1));
% 
% hsv(:,:,2) = hsv(:,:,2)*255;
% 
% hsv(:,:,2) = uint16(hsv(:,:,2));
% 
% hsv(:,:,3) = hsv(:,:,3)*255;
% 
% hsv(:,:,3) = uint16(hsv(:,:,3));
% 
% [ilehsv,byly] = liczhsv(hsv);

