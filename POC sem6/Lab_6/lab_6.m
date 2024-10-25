close all
clear all
 maseczka = [-0,-1,-1,-1,-0;
            -1,-1,-1,-1,-1;
            -1,-1,26,-1,-1;
            -1,-1,-1,-1,-1;
            -0,-1,-1,-1,-0];
a=3;
b=3;

c=3;
d=3;
%%%%%%%%%% Zadanie 1 %%%%%%%%%%%%%%%%%
img1 = imread("lenna_512x512.bmp");
[w1,k1] = size(img1);
img2 = imread("boat_512x512.bmp");
[w2,k2] = size(img2);

f_Md1 = prostokat(img1,a,b);
f_Md2 = prostokat(img2,a,b);

f_Mg1 = g_prostokat(img1,c,d);
f_Mg2 = g_prostokat(img2,c,d);

O1 = sprintf('Wielkość obrazu O1: %.1d x %.1d',w1,k1);
O2 = sprintf('Wielkość obrazu O2: %.1d x %.1d',w2,k2);

O1_Md = sprintf('Wielkość obrazu: %.1d x %.1d \n Wielkość maski: %.1d x %.1d',w1,k1,a,b);
O1_Mg = sprintf('Wielkość obrazu: %.1d x %.1d \n Wielkość maski: %.1d x %.1d',w1,k1,c,d);

O2_Md = sprintf('Wielkość obrazu: %.1d x %.1d \n Wielkość maski: %.1d x %.1d',w2,k2,a,b);
O2_Mg = sprintf('Wielkość obrazu: %.1d x %.1d \n Wielkość maski: %.1d x %.1d',w2,k2,c,d);


figure
subplot(2,3,1)
imshow(img1)
xlabel(O1)

subplot(2,3,2)
imshow(f_Md1)
xlabel(O1_Md)

subplot(2,3,3)
imshow(f_Mg1)
%imshow(maska(img1,maseczka))
xlabel(O1_Mg)

subplot(2,3,4)
imshow(img2)
xlabel(O2)

subplot(2,3,5)
imshow(f_Md2)
xlabel(O2_Md)

subplot(2,3,6)
imshow(f_Mg2);
%imshow(maska(img2,maseczka))
xlabel(O2_Mg)
%%%%%%%%%%%% Zadanie 2 %%%%%%%%%%%%%%%%%% 
Os = szumG(img1);
figure
subplot(2,3,1)
imshow(img1)
xlabel(O1)

subplot(2,3,2)
imshow(f_Md1)
%imshow(prostokat(Os,a,b))
xlabel(O1_Md)

I = g_prostokat(f_Md1,c,d);
%I = g_prostokat((prostokat(Os,a,b)),c,d);
%I = g_prostokat(img1,c,d);
%I = maska(f_Md1,maseczka);
PSNR = psnr(I,img1);
I_tekst = sprintf('Wielkość obrazu: %.1d x %.1d \n Wielkość maski: %.1d x %.1d \n PSNR:%.2f ',w2,k2,c,d,PSNR);

subplot(2,3,3)
imshow(I)
xlabel(I_tekst)


subplot(2,3,4)
imshow(Os)

subplot(2,3,5)
imshow(Os-f_Md1)
O_Id = prostokat(Os,a,b);
%imshow(O_Id)

subplot(2,3,6) 
%imshow(Os-I)
imshow(Os-f_Mg1)
%O_I = g_prostokat(O_Id,c,d);
%O_I = maska(O_Id,maseczka);
O_I = g_prostokat(O_Id,c,d);
%imshow(O_I)


