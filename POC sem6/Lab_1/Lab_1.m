clear all 
close all
Q1a=[0,70,100];
CR1a=[375,100,5];
%Q1a=[0:5:100];
%CR1a=[5:10:205];

font=60;
ile=length(Q1a);
y1=200;
y2=500;
x1=1100;
x2=1400;

% y1=50;
% y2=200;
% x1=200;
% x2=350;

%"TestImages1\diagrams\ncdfrwa.bmp"
%"ground_truth_sRGB\pathway.tiff"
imread("TestImages1\diagrams\Lena IG_Nmse+ncd.bmp");
path="TestImages1\diagrams\Lena IG_Nmse+ncd.bmp";
input=imread(path);
if isinteger(input) &&isequal(class(input),'uint16')
input = im2uint8(input);
end
[jpg,jp2,s,s2,p,p2,si,si2]=konwe(path,Q1a,CR1a,ile,font,y1,y2,x1,x2);
GIF=gif(input,font,y1,y2,x1,x2);
PNG=png(path,font,y1,y2,x1,x2);

image=[PNG,jpg;PNG,jp2];
figure

imshow(image);

   % ciach=imread('TestImages1\diagrams\ncdsaw.bmp');
   % imcrop(ciach)
%tempImage_1a = imresize(outputImageGIFRGB_1a(100:700,600:1200,:),4, 'nearest');


%%%% Rzeczywiste %%%%%%%

%jpg
% P=[21.77, 28.58,29.71,30.83,34.79];
% S=[0.5, 0.91, 0.93, 0.95, 0.99];
% Size=[2.76, 7.94, 13.18, 21.23, 113.67 ];
% figure
% %subplot(1,2,1)
% plot(si,p,'-o');
% hold on
% %jp2
% % P2=[27.59,28.65,32.83,40.65,50.59];
% % S2=[0.87, 0.89, 0.95, 0.99, 1];
% % Size2=[1.9, 3.67, 17.66, 60.12, 145.46];
% plot(si2,p2,'-x')
% title('PSNR vs. Image Size');
% xlabel('Image Size [kB]');
% ylabel('PSNR[dB]');
% legend('JPEG','JPEG2')
% 
% figure
% %subplot(1,2,2)
% plot(si,s,'-o');
% hold on
% plot(si2,s2,'-x')
% title('SSIM vs. Image Size');
% xlabel('Image Size [kB]');
% ylabel('SSIM');
%legend('JPEG','JPEG2')