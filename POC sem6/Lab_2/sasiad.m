function [output] = sasiad(image, skala)

[wiersze, kolumny, kanaly] = size(image);

nowe_wiersze = wiersze*skala;
nowe_kolumny = kolumny*skala;

output = uint8(zeros(nowe_wiersze,nowe_kolumny,kanaly));

for i=1:1:kanaly

for j=1:1:kolumny
kolumna = image(:,j,i);
kolumna = repmat(kolumna,1,skala);
if(j==1)
suma=kolumna;

else
    suma=[suma,kolumna];

end
end

for k=1:1:wiersze
wiersz = suma(k,:);
wiersz = repmat(wiersz,skala,1);

if(k==1)
out=wiersz;

else
    out=[out;wiersz];

end


end

output(:,:,i)=out;

end

