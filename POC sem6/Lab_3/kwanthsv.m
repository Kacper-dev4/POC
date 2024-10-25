function zkwantowany = kwanthsv(img, h, s, v)


zkwantowany = img;

img(:, :, 1) = round(img(:, :, 1)*360);   %H
img(:, :, 2:3) = round(img(:, :, 2:3)*255);   %S,V

zkwantowany(:, :, 1) = floor(img(:, :, 1)/floor(360/h))*floor(360/h) + floor(360/h/2);
zkwantowany(:, :, 2) = floor(img(:, :, 2)/floor(255/s))*floor(255/s) + floor(255/s/2);  
zkwantowany(:, :, 3) = floor(img(:, :, 3)/floor(255/v))*floor(255/v) + floor(255/v/2); 

zkwantowany(:, :, 1) = zkwantowany(:, :, 1)/360;
zkwantowany(:, :, 2:3) = zkwantowany(:, :, 2:3)/255;

end

