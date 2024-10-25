function newpixel = color_palette(oldpixel,r,g,b)

[~,~,kanaly] = size(oldpixel);

if(kanaly==3)
newpixel = zeros(1,1,3);

newpixel(1,1,1) = uint8(round(double(oldpixel(1,1,1))/(256/r)) * (256/r) );
newpixel(1,1,2) = uint8(round(double(oldpixel(1,1,2))/(256/g)) * (256/g) );
newpixel(1,1,3) = uint8(round(double(oldpixel(1,1,3))/(256/b)) * (256/b) );

newpixel = uint8(newpixel);
end

