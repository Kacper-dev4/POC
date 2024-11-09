function [] = poka1(img,hist,Rk,T,pscolorRk,liczbaObszarowRk,Sk,To,pscolorSk,liczbaObszarowSk)

tekstRk = sprintf('Wartosc progu: %d', T);
tekstRkLiczbaObszarow = sprintf('Liczba obszarow w Rk: %d',liczbaObszarowRk);

tekstSk = sprintf('Wartosc progu: %d', To);
tekstSkLiczbaObszarow = sprintf('Liczba obszarow w Rk: %d',liczbaObszarowSk);

figure
subplot(2,3,1)
imshow(img)
title('Obraz oryginalny')

subplot(2,3,2)
imshow(Rk)
title(tekstRk)

subplot(2,3,3)
imshow(Sk)
title(tekstSk)

subplot(2,3,4)
bar(hist)
title('Histogram obrazu')


subplot(2,3,5)
imshow(pscolorRk)
title(tekstRkLiczbaObszarow)

subplot(2,3,6)
imshow(pscolorSk)
title(tekstSkLiczbaObszarow)

end

