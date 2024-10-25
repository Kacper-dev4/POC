function zkwantowany = kwant(img, r, g, b)
[y,x,z] = size(img);
zkwantowany = ones(y,x,z, 'uint8');

for i = 1:y
    for j = 1:x
        zkwantowany(i,j,1) = uint8(floor(double(img(i,j,1))/(256/r)) * (256/r) + (256/r/2));
        zkwantowany(i,j,2) = uint8(floor(double(img(i,j,2))/(256/g)) * (256/g) + (256/g/2));
        zkwantowany(i,j,3) = uint8(floor(double(img(i,j,3))/(256/b)) * (256/b) + (256/b/2));
    end
end
end