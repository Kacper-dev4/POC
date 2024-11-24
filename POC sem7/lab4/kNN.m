function [zbior] = kNN(doPrzyporzadkowania,zbiory, k)

[~,kol] = size(doPrzyporzadkowania);

for i=1:kol
    suma = (doPrzyporzadkowania(1,i) - zbiory(:,i)).^2;
end

odleglosci = sqrt(suma);

posortowane = sort(odleglosci);


end

