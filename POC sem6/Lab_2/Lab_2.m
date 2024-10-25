clear all
%close all


% Zad 1

%image_cfa = imread('Bayer\CFA_sRGB\IMG_003_srgb_CFA.png');
%image_gt = imread('Bayer\GT_sRGB\IMG_003_srgb.png');
image_cfa4 = imread('Bayer\CFA_sRGB\IMG_003_srgb_CFA.png');
demo2 = demosaic(image_cfa4,'bggr');
org2= imread('Bayer\GT_sRGB\IMG_003_srgb.png');

image_cfa = imread("Bayer\CFA_sRGB\cienkopisy_srgb_CFA.png");
image_gt = imread('Bayer\GT_sRGB\cienkopisy_srgb.png');
i1 = demosaic(image_cfa,'gbrg');
i2 = demosaic(image_cfa,'grbg');
i3 = demosaic(image_cfa,'bggr'); % jest i on
i4 = demosaic(image_cfa,'rggb');
image_cfac=cat(3,image_cfa,image_cfa,image_cfa);

y1=80;
y2=180;
x1=90;
x2=190;
demo1=i3;
democ1=demo1(y1:y2,x1:x2,:);
psnrdemo1=psnr(demo1,image_gt);
tekst1=  sprintf('Demosaic 1 PSNR: %.2f',psnrdemo1);
democ1=imresize(democ1,4,"nearest");


democ2=demo2(y1:y2,x1:x2,:);
psnrdemo2=psnr(demo2,org2);
tekst2=  sprintf('Demosaic 2 PSNR: %.2f',psnrdemo2);
democ2=imresize(democ2,4,"nearest");

image_gtc = image_gt(y1:y2,x1:x2,:);
image_cfac= image_cfac(y1:y2,x1:x2,:);
i1c = i1(y1:y2,x1:x2,:);
i2c = i2(y1:y2,x1:x2,:);
i3c = i3(y1:y2,x1:x2,:);
i4c = i4(y1:y2,x1:x2,:);
font=30;

image_cfac=imresize(image_cfac,4,"nearest");
image_gtc=imresize(image_gtc,4,"nearest");
i1c=imresize(i1c,4,"nearest");
i2c=imresize(i2c,4,"nearest");
i3c=imresize(i3c,4,"nearest");
i4c=imresize(i4c,4,"nearest");

image_cfac=insertText(image_cfac,[1 1],'surowy','FontSize',font);
image_gtc=insertText(image_gtc,[1 1],'wzorcowy','FontSize',font);
i1c=insertText(i1c,[1 1],'gbrg','FontSize',font);
i2c=insertText(i2c,[1 1],'grbg','FontSize',font);
i3c=insertText(i3c,[1 1],'bggr','FontSize',font);
i4c=insertText(i4c,[1 1],'rggb','FontSize',font);
sklej=[image_cfac,i1c,i2c;image_gtc,i3c,i4c];

figure
imshow(sklej)
democ2=insertText(democ2,[1 1],tekst2,"FontSize",font);
democ1=insertText(democ1,[1 1],tekst1,"FontSize",font);

% Zad2 
y1=80;
y2=180;
x1=90;
x2=190;
font=30;

image_cfa1=imread('Bayer\CFA_sRGB\cienkopisy_srgb_CFA.png');
image_cfa2=imread('Bayer\CFA_sRGB\IMG_003_srgb_CFA.png');

image_gt1=imread('Bayer\GT_sRGB\cienkopisy_srgb.png');
image_gt2=imread('Bayer\GT_sRGB\IMG_003_srgb.png');

image_gtc1 = image_gt1(y1:y2,x1:x2,:);
image_cfac1= image_cfa1(y1:y2,x1:x2,:);

image_gtc2 = image_gt2(y1:y2,x1:x2,:);
image_cfac2= image_cfa2(y1:y2,x1:x2,:);

image_cfac1=imresize(image_cfac1, 4 ,"nearest");
image_gtc1=imresize(image_gtc1, 4 ,"nearest");

image_cfac2=imresize(image_cfac2,4,"nearest");
image_gtc2=imresize(image_gtc2,4,"nearest");

image_cfac1=insertText(image_cfac1,[1 1],'Obraz surowy1','FontSize',font);
image_cfac2=insertText(image_cfac2,[1 1],'Obraz surowy2','FontSize',font);

image_gtc1=insertText(image_gtc1,[1 1],'GT1','FontSize',font);
image_gtc2=insertText(image_gtc2,[1 1],'GT2','FontSize',font);




[r1,g1,b1] = rgb(image_cfa1);
R1=nn(r1);
G1=nn(g1);
B1=nn(b1);

nei1 =cat(3,B1,G1,R1);
psnr1=psnr(nei1,image_gt1);
description1 = sprintf('NN1 PSNR: %.2f',psnr1);

nei1c = nei1(y1:y2,x1:x2,:);
nei1c=imresize(nei1c,4,"nearest");
nei1c=insertText(nei1c,[1 1],description1,'FontSize',font);

[r2,g2,b2] = rgb(image_cfa2);
R2=nn(r2);
G2=nn(g2);
B2=nn(b2);

nei2 =cat(3,B2,G2,R2);
psnr2=psnr(nei2,image_gt2);
description2 = sprintf('NN2 PSNR: %.2f',psnr2);

nei2c = nei2(y1:y2,x1:x2,:);
nei2c=imresize(nei2c,4,"nearest");
nei2c=insertText(nei2c,[1 1],description2,'FontSize',font);



sklej1=[image_cfac1,nei1c,image_gtc1];
sklej2=[image_cfac2,nei2c,image_gtc2];
sklej12=[sklej1;sklej2];
% figure
% imshow(sklej1)
% 
% figure
% imshow(sklej2)

figure
imshow(sklej12)
imwrite(sklej12,'nn.png')

% Zad3

R31=bilirb(r1);
G31=bilig(g1);
B31=bilirb(b1);
bili1 = cat(3,B31,G31,R31);

psnr31=psnr(bili1,image_gt1);
description31 = sprintf('Biliniowa 1 PSNR: %.2f',psnr31);

bili1c = bili1(y1:y2,x1:x2,:);
bili1c=imresize(bili1c,4,"nearest");
bili1c=insertText(bili1c,[1 1],description31,'FontSize',font);

R32=bilirb(r2);
G32=bilig(g2);
B32=bilirb(b2);
bili2 = cat(3,B32,G32,R32);

psnr32=psnr(bili2,image_gt2);
description32 = sprintf('Biliniowa 2 PSNR: %.2f',psnr32);

bili2c = bili2(y1:y2,x1:x2,:);
bili2c=imresize(bili2c,4,"nearest");
bili2c=insertText(bili2c,[1 1],description32,'FontSize',font);

sklej3=[image_cfac1,bili1c,image_gtc1;image_cfac2,bili2c,image_gtc2];

figure
imshow(sklej3)

imwrite(sklej3,'biliniowe.png')

%Zadanie Porownanie

sklej4=[image_cfac1,image_gtc1,democ1,nei1c,bili1c;image_cfac2,image_gtc2,democ2,nei2c,bili2c];

figure
imshow(sklej4)
imwrite(sklej4,'porownanie_wszytkicasdh.png')