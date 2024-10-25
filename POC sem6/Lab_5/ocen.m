function [k1, k2, k3, k4] = ocen(img)

[M,N] = size(img);

obraz = img;
img = double(img);

lmax = max(img(:));
lmin = min(img(:));
lsre = mean(img(:));


k1 = (lmax - lmin)/255;
k2 = (lmax - lmin)/lsre;
k3 = (lmax-lmin)/(lmax+lmin);
k4 = (4.0/((255.0^2)*M*N))*sum(sum((img-lsre).^2)); 

tekst=  sprintf('wartosci: k1 = %.2f, k2 = %.2f, k3 = %.2f, k4 = %.2f \n min = %.1d max = %.1d',k1, k2, k3, k4, lmin, lmax);

imshow(obraz)
xlabel(tekst)

end

