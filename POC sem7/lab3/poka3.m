function [] = poka3(img,hist,progO,pscolorB,T,B,Oz,histOz,progOz,pscolorBz,Tz,Bz,Op,histOp,progOp,pscolorBp,Tp,Bp)

tekstprogO = sprintf('Wartość progu: %d', T);
tekstPscolorB = sprintf('Liczba obszarów: %d',B);

tekstprogOz = sprintf('Wartość progu: %d',Tz);
tekstPscolorBz = sprintf('Liczba obszarów: %d',Bz);

tekstprogOp = sprintf('Wartość progu: %d',Tp);
tekstPscolorBp = sprintf('Liczba obszarów: %d',Bp);

figure

subplot(3,4,1)
imshow(img)
title('Obraz oryginalny')

subplot(3,4,2)
bar(hist)
title('Hist(O)')

subplot(3,4,3)
imshow(progO)
title(tekstprogO)

subplot(3,4,4)
imshow(pscolorB)
title(tekstPscolorB)

subplot(3,4,5)
imshow(Oz)
title('Obraz zakłócony 20% salt & pepper')

subplot(3,4,6)
bar(histOz)
title('Hist(Oz)')

subplot(3,4,7)
imshow(progOz)
title(tekstprogOz)

subplot(3,4,8)
imshow(pscolorBz)
title(tekstPscolorBz)

subplot(3,4,9)
imshow(Op)
title('Obraz po wstępnym przetworzeniu')

subplot(3,4,10)
bar(histOp)
title('Hist(Op)')

subplot(3,4,11)
imshow(progOp)
title(tekstprogOp)

subplot(3,4,12)
imshow(pscolorBp)
title(tekstPscolorBp)

end

