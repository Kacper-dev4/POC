function [GIF] = gif(input,font,y1,y2,x1,x2)

if size(input,3)==1

    input=cat(3,input, input,input);

end

[indexedImage256, map256] = rgb2ind(input, 256);
outputFilePathGIF = sprintf('output_gif.gif');
imwrite(indexedImage256,map256, outputFilePathGIF, 'gif');
[outputImageGIF, map] = imread(outputFilePathGIF);
outputImageGIFRGB = im2uint8(ind2rgb(outputImageGIF,map));

 psnrValuesGIF = psnr(input, outputImageGIFRGB);
 ssimValuesGIF=ssim(input,outputImageGIFRGB);
 fileInfoGIF_1a = dir(outputFilePathGIF);
 imageSizesGIF_1a = fileInfoGIF_1a.bytes / 1024; % Convert to kilobytes
 
 description_1a = sprintf('GIF\n PSNR: %.2f\n SSIM: %2.f\nSize: %.2f kB ', psnrValuesGIF, ssimValuesGIF,imageSizesGIF_1a);



 GIF_crop = imcrop(outputImageGIFRGB, [x1, y1, x2-x1, y2-y1]);


outputImageGIFRGB = imresize(GIF_crop, 4, 'nearest');
   

 
 GIF = insertText(outputImageGIFRGB,[1,1],description_1a,'FontSize',font);





end

