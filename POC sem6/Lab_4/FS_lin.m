
function dithered = FS_lin(image,ile)
dithered = double(image);

[w,k, kan] = size(image);
dithered = double(dithered);

paleta = linspace(0,255,ile);

for j=0:kan
for y=1:w
    for x=1:k
oldpixel = dithered(y,x,kan);

[~,indeks] = min(abs(paleta - oldpixel));


newpixel = paleta(indeks);

dithered(y,x,kan) = newpixel;
quant_error = (oldpixel) - (newpixel);
if(x<512)
dithered(y,x+1,kan) = dithered(y,x+1,kan) + (7/16)* quant_error;
end
if(x>1 && y<512)
dithered(y+1,x-1,kan) = dithered(y+1,x-1,kan) + (3/16)* quant_error;
end
if(y<512)
dithered(y+1,x,kan) = dithered(y+1,x,kan) + (5/16)* quant_error;
end
if(x<512 && y<512)
dithered(y+1,x+1,kan) = dithered(y+1,x+1,kan) + (1/16)* quant_error;
end     
end
end
end

dithered = uint8(dithered);


end

