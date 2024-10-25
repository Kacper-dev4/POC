function out = FS_kolorki(image,ile)

[out,mapa] = rgb2ind(image,ile);
out = ind2rgb(out,mapa);

end

