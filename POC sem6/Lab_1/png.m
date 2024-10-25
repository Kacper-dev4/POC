function [PNG] = png(path,font,y1,y2,x1,x2)

bmp=imread(path);

if isinteger(bmp) &&isequal(class(bmp),'uint16')
bmp = im2uint8(bmp);
end
imwrite(bmp,'output.png');
png=imread('output.png');

info_bmp=dir(path);
info_png=dir('output.png');

size_bmp=info_bmp.bytes / 1024;
size_png=info_png.bytes / 1024;

psnr_png = psnr(png,bmp);
   
description_bmp_png = sprintf('No compression (tiff):\n Size:%.2f kB\nPNG (PSNR: %.2f)\nSize: %.2f kB ', size_bmp ,psnr_png, size_png);


 png_crop = imcrop(png, [x1, y1, x2-x1, y2-y1]);
png = imresize(png_crop, 4, 'nearest');

PNG = insertText(png,[1 1],description_bmp_png,'FontSize',font);


end

