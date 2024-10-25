function newpixel = paletka(oldpixel, n)

paleta = linspace(0, 255,n);
paleta = double(paleta);
[~,indeks] = min(abs(paleta - (oldpixel)));
newpixel = paleta(indeks); 


end

