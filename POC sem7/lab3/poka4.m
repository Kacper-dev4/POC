function [] = poka4(O,B,pscolorB, obszaryB,T,Bm,opisMi,pscolorBm, liczbaObszarowBmi)

tekstB = sprintf('Wartość progu: %d',T);
tekstObszaryB = sprintf('Liczba obszarów w B: %d',obszaryB);

[~,~,k] = size(Bm);
k = k + 1; 

figure
subplot(3,k,1)
imshow(O);
title('Obraz oryginalny')
subplot(3,k,k+1)
imshow(B);
title(tekstB)
subplot(3,k,k+k+1)
imshow(pscolorB);
title(tekstObszaryB)
indeks = 1;
for i=2:k

    tekstObszaryBMi = sprintf('Liczba obszarów w Bm%d: %d',indeks,liczbaObszarowBmi(indeks));
    subplot(3,k,k+i)
    imshow(Bm(:,:,indeks))
    title(opisMi(indeks))

    subplot(3,k,k+k+i)
    imshow(pscolorBm(:,:,:,indeks))
    title(tekstObszaryBMi)

    indeks = indeks + 1;
end

