function [] = poka1(img,hist,Rk,prog,pscolor,liczbaObszarowRk)

tekstRk = sprintf('Wartosc progu: %d', prog);
tekstRkLiczbaObszarow = sprintf('Liczba obszarow w Rk: %d',liczbaObszarowRk);

figure
subplot(2,2,1)
imshow(img)
title('Obraz oryginalny')

subplot(2,2,2)
imshow(Rk)
title(tekstRk)

subplot(2,2,3)
bar(hist)
title('Histogram obrazu')


subplot(2,2,4)
imshow(pscolor)
title(tekstRkLiczbaObszarow)

end

