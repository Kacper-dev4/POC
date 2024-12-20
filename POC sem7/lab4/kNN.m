function [odleglosci,xmed,indeksy,klasyfikacja] = kNN(doPrzyporzadkowania,zbiory, k)

medianaIndeks = [1,0,2,0,3,0,4];
indeksy = 0;
[~,kol] = size(doPrzyporzadkowania);

for i=1:kol
    suma = (doPrzyporzadkowania(1,i) - zbiory(:,i)).^2;
end

odleglosci = sqrt(suma);

posortowane = sort(odleglosci);

xmed = posortowane(medianaIndeks(k)+1);

indeks = find(odleglosci == xmed);


if indeks >=1 & indeks<=5
   klasyfikacja = sprintf('Zaklasyfikowano jako: trójkąt k=%d',k);
end
if indeks >=6 & indeks<=10
   klasyfikacja = sprintf('Zaklasyfikowano jako: koło k=%d',k);
end
if indeks >=12 & indeks<=16
   klasyfikacja = sprintf('Zaklasyfikowano jako: kwadrat k=%d',k);
end

if indeks == 11 | indeks == 17
    klasyfikacja = sprintf('drugi Przeksztalcony');
end

for i=1:k
    x = posortowane(i + 1);
    if any(indeksy == find(odleglosci == x,1))
    indeksy(i)  = find(odleglosci == x,1,'last');
    else
    indeksy(i)  = find(odleglosci == x,1);
    end
end

end