function dithered = FS(image)

[w,k, ~] = size(image);
image = double(image);
for y=1:w
    for x=1:k
oldpixel = image(y,x);
newpixel = find_palette(oldpixel);

image(y,x) = newpixel;
quant_error = (oldpixel) - (newpixel);
if(x<512)
image(y,x+1) = image(y,x+1) + (7/16)* quant_error;
end
if(x>1 && y<512)
image(y+1,x-1) = image(y+1,x-1) + (3/16)* quant_error;
end
if(y<512)
image(y+1,x) = image(y+1,x) + (5/16)* quant_error;
end
if(x<512 && y<512)
image(y+1,x+1) = image(y+1,x+1) + (1/16)* quant_error;
end     
end
end

dithered = uint8(image);


end

