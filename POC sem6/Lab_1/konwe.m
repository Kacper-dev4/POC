function [jpg,jp2,s,s2,p,p2,si,si2] = konwe(path,Q,CR,ile,font,y1,y2,x1,x2)

bmp=imread(path);

if isinteger(bmp) &&isequal(class(bmp),'uint16')
bmp = im2uint8(bmp);
end
for i=1:1:ile

filePathJPEG=sprintf('output_quality_%d.jpg',Q(i));
filePathJPEG2=sprintf('outout_quality_%d.jp2',CR(i));

imwrite(bmp,filePathJPEG,'jpg','Quality',Q(i) );
imwrite(bmp,filePathJPEG2,'jp2','Mode','lossy','CompressionRatio',CR(i));

sklej_jpg=imread(filePathJPEG);
sklej_jp2=imread(filePathJPEG2);

info_jpg = dir(filePathJPEG);
info_jp2 = dir(filePathJPEG2);

size_jpg = info_jpg.bytes / 1024; 
si(i)=size_jpg;
size_jp2 = info_jp2.bytes / 1024;
si2(i)=size_jp2;

psnr_jpg = psnr(sklej_jpg,bmp);
p(i)=psnr_jpg;
psnr_jp2 = psnr(sklej_jp2,bmp);
p2(i)=psnr_jp2;

ssim_jpg = ssim(sklej_jpg,bmp);
s(i)=ssim_jpg;
ssim_jp2 = ssim(sklej_jp2,bmp);
s2(i)=ssim_jp2;

description_jpg = sprintf('JPEG\nQ: %.2f\nPSNR: %.2f\nSSIM: %.2f\nSize: %.2f kB',Q(i),psnr_jpg,ssim_jpg,size_jpg);
description_jp2 = sprintf('JPEG2000\nCR: %.2f\nPSNR: %.2f\nSSIM: %.2f\nSize: %.2f kB',CR(i),psnr_jp2,ssim_jp2,size_jp2);

 
% sklej_jpg=imresize(sklej_jpg(y1:y2,x1:x2),4, 'nearest');
% sklej_jp2=imresize(sklej_jp2(y1:y2,x1:x2),4, 'nearest');

sklej_jpg_crop = imcrop(sklej_jpg, [x1, y1, x2-x1, y2-y1]);
sklej_jp2_crop = imcrop(sklej_jp2, [x1, y1, x2-x1, y2-y1]);

sklej_jpg = imresize(sklej_jpg_crop, 4, 'nearest');
sklej_jp2 = imresize(sklej_jp2_crop, 4, 'nearest');

%sklej_jpg=sklej_jpg(y1:y2,x1:x2);
%sklej_jp2=sklej_jp2(y1:y2,x1:x2);


sklej_jpg= insertText(sklej_jpg,[1 1],description_jpg,'FontSize',font);
sklej_jp2= insertText(sklej_jp2,[1 1],description_jp2,'FontSize',font);


if(i==1)
jpg=sklej_jpg;
jp2=sklej_jp2;
end
if(i~=1)
jpg=[jpg,sklej_jpg];
jp2=[jp2,sklej_jp2];
end
end

end