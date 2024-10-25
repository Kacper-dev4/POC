clear all
close all 
clc

%imnoise(O1,'salt & pepper',0.01)
%im1z=[O1(250:400,250:400,:),O1n1(250:400,250:400,:),O1n2(250:400,250:400,:),O1n3(250:400,250:400,:)];
%im1a=imresize(im1z,3,'nearest%);

% Zadanie 1

img1 = imread('monarch_g_512x512.bmp');
img2 = imread('boat_512x512.bmp');

img3 = imread('monarch_512x512.bmp');
img4 = imread('boats_512x512.bmp');

figure
[img1p1,img1p2,img1p10]=szumy(img1);

xlabel('Obraz 1                                   O1 + szum impulsowy 1%                        O1 + szum impulsowy 2%                   O1 + szum impulsowy 10%')


figure
[img2p1,img2p2,img2p10]=szumy(img2);
xlabel('Obraz 2                                   O2 + szum impulsowy 1%                        O2 + szum impulsowy 2%                   O2 + szum impulsowy 10%')

figure
[img3p1,img3p2,img3p10]=szumy(img3);

xlabel('Obraz 1                                   O1 + szum impulsowy 1%                        O1 + szum impulsowy 2%                   O1 + szum impulsowy 10%')


figure
[img4p1,img4p2,img4p10]=szumy(img4);
xlabel('Obraz 2                                   O2 + szum impulsowy 1%                        O2 + szum impulsowy 2%                   O2 + szum impulsowy 10%')

%%%%%%%%%%%% Sprawdzanie procentowego zaszumienia %%%%%%%%%%%%%%

wszytkiePiksele1 = numel(img1);

noisy1p1 = sum(img1(:) ~= img1p1(:));

noisy1p2 = sum(img1(:) ~= img1p2(:));

noisy1p10 = sum(img1(:) ~= img1p10(:));

procent1p1 = (noisy1p1/wszytkiePiksele1)*100

procent1p2 = (noisy1p2/wszytkiePiksele1)*100

procent1p10 = (noisy1p10/wszytkiePiksele1)*100





%%% Inny sposób wyrysowania

% figure 
% subplot(2,4,1)
% imshow(img1)
% 
% subplot(2,4,2)
% imshow(img1p1)
% 
% subplot(2,4,3)
% imshow(img1p2)
% 
% subplot(2,4,4)
% imshow(img1p10)
% 
% subplot(2,4,5)
% imshow(img2)
% 
% subplot(2,4,6)
% imshow(img2p1)
% 
% subplot(2,4,7)
% imshow(img2p2)
% 
% subplot(2,4,8)
% imshow(img2p10)
% 

%Zadanie 2a 

img1p3 = imnoise(img1,'salt & pepper',0.03);

med13 = media(img1p3,3);
med15 = media(img1p3,5);
med17 = media(img1p3,7); 

med23 = media(img2p1,3);
med25 = media(img2p1,5);
med27 = media(img2p1,7);

psnr1p3 = psnr(img1p3,img1);
op1p3 = sprintf('O1+3%% PSNR: %.2f',psnr1p3);

psnrmed13 = psnr(med13,img1);
opmed13 = sprintf('mediana 3x3 PSNR: %.2f',psnrmed13);

psnrmed15 = psnr(med15,img1);
opmed15 = sprintf('mediana 5x5 PSNR: %.2f',psnrmed15);

psnrmed17 = psnr(med17,img1);
opmed17 = sprintf('mediana 7x7 PSNR: %.2f',psnrmed17);



psnr2p1 = psnr(img2p1,img2);
op2p1 = sprintf('O2+1%% PSNR: %.2f',psnr2p1);

psnrmed23 = psnr(med23,img2);
opmed23 = sprintf('mediana 3x3 PSNR: %.2f',psnrmed23);

psnrmed25 = psnr(med25,img2);
opmed25 = sprintf('mediana 5x5 PSNR: %.2f',psnrmed25);

psnrmed27 = psnr(med27,img2);
opmed27 = sprintf('mediana 7x7 PSNR: %.2f',psnrmed27);


% figure
% subplot(2,5,1)
% imshow(img1)
% xlabel('Oryginał 1(O1)')
% 
% subplot(2,5,2)
% imshow(img1p3)
% xlabel(op1p3)
% 
% subplot(2,5,3)
% imshow(med13)
% xlabel(opmed13)
% 
% subplot(2,5,4)
% imshow(med15)
% xlabel(opmed15)
% 
% subplot(2,5,5)
% imshow(med17)
% xlabel(opmed17)
% 
% subplot(2,5,6)
% imshow(img2)
% xlabel('Oryginał 2(O2)')
% 
% subplot(2,5,7)
% imshow(img2p1)
% xlabel(op2p1)
% 
% subplot(2,5,8)
% imshow(med23)
% xlabel(opmed23)
% 
% subplot(2,5,9)
% imshow(med25)
% xlabel(opmed25)
% 
% subplot(2,5,10)
% imshow(med27)
% xlabel(opmed27)


%%%%%%%%%%%%%%5 Przybliżenie %%%%%%%%%%%%%%%%%%%%

figure
% Przybliżenie obrazów dla Oryginał 1 (O1) i jego przekształceń
im1z = [img1(250:400,250:400,:), img1p3(250:400,250:400,:), med13(250:400,250:400,:), med15(250:400,250:400,:)];
im1a = imresize(im1z, 3, 'nearest');

subplot(2,5,1)
imshow(imresize(img1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment Oryginał 1 (O1)
xlabel('Oryginał 1(O1)')

subplot(2,5,2)
imshow(imresize(img1p3(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img1p3
xlabel(op1p3)

subplot(2,5,3)
imshow(imresize(med13(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med13
xlabel(opmed13)

subplot(2,5,4)
imshow(imresize(med15(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med15
xlabel(opmed15)

subplot(2,5,5)
imshow(imresize(med17(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med17
xlabel(opmed17)

% Przybliżenie obrazów dla Oryginał 2 (O2) i jego przekształceń
subplot(2,5,6)
imshow(imresize(img2(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment Oryginał 2 (O2)
xlabel('Oryginał 2(O2)')

subplot(2,5,7)
imshow(imresize(img2p1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img2p1
xlabel(op2p1)

subplot(2,5,8)
imshow(imresize(med23(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med23
xlabel(opmed23)

subplot(2,5,9)
imshow(imresize(med25(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med25
xlabel(opmed25)

subplot(2,5,10)
imshow(imresize(med27(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med27
xlabel(opmed27)




matLab1 = medFil(img1p3);
matLab2 = medFil(img2p1);

psnrLab1 = psnr(matLab1,img1);
opLab1 = sprintf('mediana metoda matlaba PSNR: %.2f',psnrLab1);

psnrLab2 = psnr(matLab2,img2);
opLab2 = sprintf('mediana metoda matlaba PSNR: %.2f',psnrLab2);


figure
subplot(1,2,1)
imshow(matLab1)
xlabel(opLab1)

subplot(1,2,2)
imshow(med13)
xlabel(opmed13)

figure
subplot(1,2,1)
imshow(matLab2)
xlabel(opLab2)

subplot(1,2,2)
imshow(med23)
xlabel(opmed23)

%Zadanie 2b

lum3k0 = LUM(img1p1,3,0);
lum3k1 = LUM(img1p1,3,1);
lum3k2 = LUM(img1p1,3,2);
lum3k3 = LUM(img1p1,3,3);
lum3k4 = LUM(img1p1,3,4);
lum5k1 = LUM(img1p1,5,5);

psnr1p1 = psnr(img1p1,img1);
op1p1 = sprintf('O1+1%% PSNR: %.2f',psnr1p1);

psnrlum3k0 = psnr(lum3k0,img1);
oplum3k0 = sprintf('LUM 3 x 3, k=0 PSNR: %.2f',psnrlum3k0);

psnrlum3k1 = psnr(lum3k1,img1);
oplum3k1 = sprintf('LUM 3 x 3, k=1 PSNR: %.2f',psnrlum3k1);

psnrlum3k2 = psnr(lum3k2,img1);
oplum3k2 = sprintf('LUM 3 x 3, k=2 PSNR: %.2f',psnrlum3k2);

psnrlum3k3 = psnr(lum3k3,img1);
oplum3k3 = sprintf('LUM 3 x 3, k=3 PSNR: %.2f',psnrlum3k3);

psnrlum3k4 = psnr(lum3k4,img1);
oplum3k4 = sprintf('LUM 3 x 3, k=4 PSNR: %.2f',psnrlum3k4);

psnrlum5k1 = psnr(lum5k1,img1);
oplum5k1 = sprintf('LUM 5 x 5, k=5 PSNR: %.2f',psnrlum5k1);

%%%%%%%%%%% Wyrysowywanie %%%%%%%%%%%%%%%%%%5
% figure
% subplot(2,4,1)
% imshow(img1)
% xlabel('Oryginał 1(O1)')
% 
% subplot(2,4,2)
% imshow(img1p1)
% xlabel(op1p1)
% 
% subplot(2,4,3)
% imshow(lum3k0)
% xlabel(oplum3k0)
% 
% subplot(2,4,4)
% imshow(lum3k1)
% xlabel(oplum3k1)
% 
% subplot(2,4,5)
% imshow(lum3k2)
% xlabel(oplum3k2)
% 
% subplot(2,4,6)
% imshow(lum3k3)
% xlabel(oplum3k3)
% 
% subplot(2,4,7)
% imshow(lum3k4)
% xlabel(oplum3k4)
% %xlabel(opmed13)
% 
% subplot(2,4,8)
% imshow(lum5k1)
% xlabel(oplum5k1)



%%%%%%%%%%%%%% Przybliżenie %%%%%%%%%%%%%%%%%%%%%%5

figure
% Przybliżenie obrazów dla Oryginał 1 (O1) i jego przekształceń
subplot(2,4,1)
imshow(imresize(img1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment Oryginał 1 (O1)
xlabel('Oryginał 1(O1)')

subplot(2,4,2)
imshow(imresize(img1p1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img1p1
xlabel(op1p1)

subplot(2,4,3)
imshow(imresize(lum3k0(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum3k0
xlabel(oplum3k0)

subplot(2,4,4)
imshow(imresize(lum3k1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum3k1
xlabel(oplum3k1)

subplot(2,4,5)
imshow(imresize(lum3k2(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum3k2
xlabel(oplum3k2)

subplot(2,4,6)
imshow(imresize(lum3k3(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum3k3
xlabel(oplum3k3)

subplot(2,4,7)
imshow(imresize(lum3k4(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum3k4
xlabel(oplum3k4)
%xlabel(opmed13) 

subplot(2,4,8)
imshow(imresize(lum5k1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment lum5k1
xlabel(oplum5k1)



%Zadanie 2c

img1p15 = imnoise(img1,'salt & pepper',0.15);
psnr1p15 = psnr(img1p15,img1);
op1p15 = sprintf('O1+15%% PSNR: %.2f',psnr1p15);

med1p15 = media(img1p15,3);
psnrmed1p15 = psnr(med1p15,img1);
opmed1p15 = sprintf('mediana 3 x 3 PSNR: %.2f',psnrmed1p15);

lumk1p15 = LUM(img1p15,3,1);
psnrlumk1p15 = psnr(lumk1p15,img1);
oplumk1p15 = sprintf('LUM1 k=1 PSNR: %.2f',psnrlumk1p15);


lumk3p15 = LUM(img1p15,3,3);
psnrlumk3p15 = psnr(lumk3p15,img1);
oplumk3p15 = sprintf('LUM2 k=3 PSNR: %.2f',psnrlumk3p15);


med1p1n3 = media(img1p1,3);
psnrmed1p1n3 = psnr(med1p1n3,img1);
opmed1p1n3 = sprintf('mediana 3 x 3 PSNR: %.2f',psnrmed1p1n3);

lumk1p1 = LUM(img1p1,3,1);
psnrlumk1p1 = psnr(lumk1p1,img1);
oplumk1p1 = sprintf('LUM1 k=1 PSNR: %.2f',psnrlumk1p1);


lumk3p1 = LUM(img1p1,3,3);
psnrlumk3p1 = psnr(lumk3p1,img1);
oplumk3p1 = sprintf('LUM2 k=3 PSNR: %.2f',psnrlumk3p1);

lumk1p3 = LUM(img1p3,3,1);
psnrlumk1p3 = psnr(lumk1p3,img1);
oplumk1p3 = sprintf('LUM1 k=1 PSNR: %.2f',psnrlumk1p3);

lumk3p3 = LUM(img1p3,3,3);
psnrlumk3p3 = psnr(lumk3p3,img1);
oplumk3p3 = sprintf('LUM2 k=3 PSNR: %.2f',psnrlumk3p3);


%%%%%%%%%%%%%% Rysowanie %%%%%%%%%%%%%%%%%%%%5
% figure
% subplot(3,5,1)
% imshow(img1)
% xlabel('Oryginał 1(O1)')
% 
% subplot(3,5,2)
% imshow(img1p1)
% xlabel(op1p1)
% 
% subplot(3,5,3)
% imshow(med1p1n3)
% xlabel(opmed1p1n3)
% 
% subplot(3,5,4)
% imshow(lumk1p1)
% xlabel(oplumk1p1)
% 
% subplot(3,5,5)
% imshow(lumk3p1)
% xlabel(oplumk3p1)
% 
% subplot(3,5,7)
% imshow(img1p3)
% xlabel(op1p3)
% 
% subplot(3,5,8)
% imshow(med13)
% xlabel(opmed13)
% 
% subplot(3,5,9)
% imshow(lumk1p3)
% xlabel(oplumk1p3)
% 
% subplot(3,5,10)
% imshow(lumk3p3)
% xlabel(oplumk3p3)
% 
% subplot(3,5,12)
% imshow(img1p15)
% xlabel(op1p15)
% 
% subplot(3,5,13)
% imshow(med1p15)
% xlabel(opmed1p15)
% 
% subplot(3,5,14)
% imshow(lumk1p15)
% xlabel(oplumk1p15)
% 
% subplot(3,5,15)
% imshow(lumk3p15)
% xlabel(oplumk3p15)

%%%%%%%%%%%%%% Rysowanie z przybliżeniem %%%%%%%%%%%%%%%%%%%%

% Definicja obszaru przybliżenia (zmień w razie potrzeby)
x_start = 250; x_end = 400; % Zakres współrzędnych w pionie
y_start = 250; y_end = 400; % Zakres współrzędnych w poziomie

figure

% Oryginał 1
im1z = img1(x_start:x_end, y_start:y_end, :);
im1a = imresize(im1z, 3, 'nearest');
subplot(3,5,1)
imshow(im1a)
xlabel('Oryginał 1(O1)')

% img1p1
im1p1z = img1p1(x_start:x_end, y_start:y_end, :);
im1p1a = imresize(im1p1z, 3, 'nearest');
subplot(3,5,2)
imshow(im1p1a)
xlabel(op1p1)

% med1p1n3
med1p1n3z = med1p1n3(x_start:x_end, y_start:y_end, :);
med1p1n3a = imresize(med1p1n3z, 3, 'nearest');
subplot(3,5,3)
imshow(med1p1n3a)
xlabel(opmed1p1n3)

% lumk1p1
lumk1p1z = lumk1p1(x_start:x_end, y_start:y_end, :);
lumk1p1a = imresize(lumk1p1z, 3, 'nearest');
subplot(3,5,4)
imshow(lumk1p1a)
xlabel(oplumk1p1)

% lumk3p1
lumk3p1z = lumk3p1(x_start:x_end, y_start:y_end, :);
lumk3p1a = imresize(lumk3p1z, 3, 'nearest');
subplot(3,5,5)
imshow(lumk3p1a)
xlabel(oplumk3p1)

% img1p3
img1p3z = img1p3(x_start:x_end, y_start:y_end, :);
img1p3a = imresize(img1p3z, 3, 'nearest');
subplot(3,5,7)
imshow(img1p3a)
xlabel(op1p3)

% med13
med13z = med13(x_start:x_end, y_start:y_end, :);
med13a = imresize(med13z, 3, 'nearest');
subplot(3,5,8)
imshow(med13a)
xlabel(opmed13)

% lumk1p3
lumk1p3z = lumk1p3(x_start:x_end, y_start:y_end, :);
lumk1p3a = imresize(lumk1p3z, 3, 'nearest');
subplot(3,5,9)
imshow(lumk1p3a)
xlabel(oplumk1p3)

% lumk3p3
lumk3p3z = lumk3p3(x_start:x_end, y_start:y_end, :);
lumk3p3a = imresize(lumk3p3z, 3, 'nearest');
subplot(3,5,10)
imshow(lumk3p3a)
xlabel(oplumk3p3)

% img1p15
img1p15z = img1p15(x_start:x_end, y_start:y_end, :);
img1p15a = imresize(img1p15z, 3, 'nearest');
subplot(3,5,12)
imshow(img1p15a)
xlabel(op1p15)

% med1p15
med1p15z = med1p15(x_start:x_end, y_start:y_end, :);
med1p15a = imresize(med1p15z, 3, 'nearest');
subplot(3,5,13)
imshow(med1p15a)
xlabel(opmed1p15)

% lumk1p15
lumk1p15z = lumk1p15(x_start:x_end, y_start:y_end, :);
lumk1p15a = imresize(lumk1p15z, 3, 'nearest');
subplot(3,5,14)
imshow(lumk1p15a)
xlabel(oplumk1p15)

% lumk3p15
lumk3p15z = lumk3p15(x_start:x_end, y_start:y_end, :);
lumk3p15a = imresize(lumk3p15z, 3, 'nearest');
subplot(3,5,15)
imshow(lumk3p15a)
xlabel(oplumk3p15)


% Zadanie 3a 

psnr3p1 = psnr(img3p1,img3);
op3p1 = sprintf('O1+1%% PSNR: %.2f',psnr3p1);

psnr3p2 = psnr(img3p2,img3);
op3p2 = sprintf('O1+2%% PSNR: %.2f',psnr3p2);

psnr3p10 = psnr(img3p10,img3);
op3p10 = sprintf('O1+10%% PSNR: %.2f',psnr3p10);

med3p1 = media(img3p1,3);
psnrmed3p1 = psnr(med3p1,img3);
opmed3p1 = sprintf('O1+1%% + mediana PSNR: %.2f',psnrmed3p1);

med3p2 = media(img3p2,3);
psnrmed3p2 = psnr(med3p2,img3);
opmed3p2 = sprintf('O1+2%% + mediana PSNR: %.2f',psnrmed3p2);

med3p10 = media(img3p10,3);
psnrmed3p10 = psnr(med3p10,img3);
opmed3p10 = sprintf('O1+10%% + mediana PSNR: %.2f',psnrmed3p10);

% figure
% 
% subplot(2,4,1)
% imshow(img3)
% xlabel('Oryginał 1(O1)')
% 
% subplot(2,4,2)
% imshow(img3p1)
% xlabel(op3p1)
% 
% subplot(2,4,3)
% imshow(img3p2)
% xlabel(op3p2)
% 
% subplot(2,4,4)
% imshow(img3p10)
% xlabel(op3p10)
% 
% subplot(2,4,6)
% imshow(med3p1)
% xlabel(opmed3p1)
% 
% subplot(2,4,7)
% imshow(med3p2)
% xlabel(opmed3p2)
% 
% subplot(2,4,8)
% imshow(med3p10)
% xlabel(opmed3p10)

%%%%%%%%%%%% Przybliżenie %%%%%%%%%%%%%%%


figure

% Przybliżenie obrazów dla Oryginał 1 (O1) i jego przekształceń
subplot(2,4,1)
imshow(imresize(img3(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment Oryginał 1 (O1)
xlabel('Oryginał 1(O1)')

subplot(2,4,2)
imshow(imresize(img3p1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img3p1
xlabel(op3p1)

subplot(2,4,3)
imshow(imresize(img3p2(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img3p2
xlabel(op3p2)

subplot(2,4,4)
imshow(imresize(img3p10(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment img3p10
xlabel(op3p10)

% Pomiń subplot (2,4,5) jako pusty i przejdź dalej
subplot(2,4,6)
imshow(imresize(med3p1(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med3p1
xlabel(opmed3p1)

subplot(2,4,7)
imshow(imresize(med3p2(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med3p2
xlabel(opmed3p2)

subplot(2,4,8)
imshow(imresize(med3p10(250:400,250:400,:), 3, 'nearest')) % Przybliżony fragment med3p10
xlabel(opmed3p10)

% Zadanie 3b

%%% Wybrałem L1

vmf3p1 = VMFL2(img3p1);
psnrvmf3p1 = psnr(vmf3p1,img3);
opvmf3p1 = sprintf('O1+1%% + VMF L2 PSNR: %.2f',psnrvmf3p1);

vmf3p2 = VMFL2(img3p2);
psnrvmf3p2 = psnr(vmf3p2,img3);
opvmf3p2 = sprintf('O1+2%% + VMF L2 PSNR: %.2f',psnrvmf3p2);

vmf3p10 = VMFL2(img3p10);
psnrvmf3p10 = psnr(vmf3p10,img3);
opvmf3p10 = sprintf('O1+10%% + VMF L2 PSNR: %.2f',psnrvmf3p10);




%%%%%% Wyrysowywanie %%%%%%%%%5

% figure
% subplot(3,4,1)
% imshow(img3)
% xlabel('Oryginał 1(O1)')
% 
% subplot(3,4,2)
% imshow(img3p1)
% xlabel(op3p1)
% 
% subplot(3,4,3)
% imshow(img3p2)
% xlabel(op3p2)
% 
% subplot(3,4,4)
% imshow(img3p10)
% xlabel(op3p10)
% 
% subplot(3,4,6)
% imshow(vmf3p1)
% xlabel(opvmf3p1)
% 
% subplot(3,4,7)
% imshow(vmf3p2)
% xlabel(opvmf3p2)
% 
% subplot(3,4,8)
% imshow(vmf3p10)
% xlabel(opvmf3p10)


%%%%%%%%%%% Przybliżenie %%%%%%%%%%%%%


figure
% Oryginalny obraz 1 (O1)
subplot(3,4,1)
img_crop = img3(250:400,250:400,:);  % Wycięcie fragmentu
img_resized = imresize(img_crop, 3, 'nearest');  % Zmiana rozmiaru
imshow(img_resized)
xlabel('Oryginał 1(O1)')

% Przetworzony obraz 1 (op3p1)
subplot(3,4,2)
img_crop = img3p1(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p1)

% Przetworzony obraz 2 (op3p2)
subplot(3,4,3)
img_crop = img3p2(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p2)

% Przetworzony obraz 10 (op3p10)
subplot(3,4,4)
img_crop = img3p10(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p10)

% Przetworzony VMF obraz 1 (opvmf3p1)
subplot(3,4,6)
img_crop = vmf3p1(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p1)

% Przetworzony VMF obraz 2 (opvmf3p2)
subplot(3,4,7)
img_crop = vmf3p2(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p2)

% Przetworzony VMF obraz 10 (opvmf3p10)
subplot(3,4,8)
img_crop = vmf3p10(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p10)


%%%%%%%%%%%% Zadanie 3c %%%%%%%%%%%

vmf3p12 = VMFL2(vmf3p1);
psnrvmf3p12 = psnr(vmf3p12,img3);
opvmf3p12 = sprintf('O1+1%% + VMF PSNR: %.2f',psnrvmf3p12);

vmf3p22 = VMFL2(vmf3p2);
psnrvmf3p22 = psnr(vmf3p22,img3);
opvmf3p22 = sprintf('O1+2%% + VMF PSNR: %.2f',psnrvmf3p22);

vmf3p102 = VMFL2(vmf3p10);
psnrvmf3p102 = psnr(vmf3p102,img3);
opvmf3p102 = sprintf('O1+10%% + VMF PSNR: %.2f',psnrvmf3p102);

%%%%%%%%%% Wyrysowanie %%%%%%%%%%%%%%%%

% figure 
% subplot(3,5,1)
% imshow(img3)
% xlabel('Oryginał 1(O1)')
% 
% subplot(3,5,2)
% imshow(img3p1)
% xlabel(op3p1)
% 
% subplot(3,5,3)
% imshow(med3p1)
% xlabel(opmed3p1)
% 
% subplot(3,5,4)
% imshow(vmf3p1)
% xlabel(opvmf3p1)
% 
% subplot(3,5,5)
% imshow(vmf3p12)
% xlabel(opvmf3p12)
% 
% subplot(3,5,7)
% imshow(img3p2)
% xlabel(op3p2)
% 
% subplot(3,5,8)
% imshow(med3p2)
% xlabel(opmed3p2)
% 
% subplot(3,5,9)
% imshow(vmf3p2)
% xlabel(opvmf3p2)
% 
% subplot(3,5,10)
% imshow(vmf3p22)
% xlabel(opvmf3p22)
% 
% subplot(3,5,12)
% imshow(img3p10)
% xlabel(op3p10)
% 
% subplot(3,5,13)
% imshow(med3p10)
% xlabel(opmed3p10)
% 
% subplot(3,5,14)
% imshow(vmf3p10)
% xlabel(opvmf3p10)
% 
% subplot(3,5,15)
% imshow(vmf3p102)
% xlabel(opvmf3p102)

%%%%%%%%%% Wyrysowanie i przybliżanie %%%%%%%%%%%%%%%%

figure 
% Oryginał 1
subplot(3,5,1)
img_crop = img3(250:400,250:400,:);  
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel('Oryginał 1(O1)')

% Przetworzony obraz 1
subplot(3,5,2)
img_crop = img3p1(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p1)

% Medianowy obraz 1
subplot(3,5,3)
img_crop = med3p1(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opmed3p1)

% VMF obraz 1
subplot(3,5,4)
img_crop = vmf3p1(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p1)

% VMF obraz 1 z 1% szumem
subplot(3,5,5)
img_crop = vmf3p12(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p12)

% Przetworzony obraz 2
subplot(3,5,7)
img_crop = img3p2(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p2)

% Medianowy obraz 2
subplot(3,5,8)
img_crop = med3p2(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opmed3p2)

% VMF obraz 2
subplot(3,5,9)
img_crop = vmf3p2(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p2)

% VMF obraz 2 z 2% szumem
subplot(3,5,10)
img_crop = vmf3p22(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p22)

% Przetworzony obraz 10
subplot(3,5,12)
img_crop = img3p10(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(op3p10)

% Medianowy obraz 10
subplot(3,5,13)
img_crop = med3p10(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opmed3p10)

% VMF obraz 10
subplot(3,5,14)
img_crop = vmf3p10(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p10)

% VMF obraz 10 z 10% szumem
subplot(3,5,15)
img_crop = vmf3p102(250:400,250:400,:);
img_resized = imresize(img_crop, 3, 'nearest');
imshow(img_resized)
xlabel(opvmf3p102)


 
