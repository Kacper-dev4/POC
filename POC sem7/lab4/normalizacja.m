function [normT,normC,normS] = normalizacja(wsp)

maks1 = max(wsp(:,1));
maks2 = max(wsp(:,2));
maks3 = max(wsp(:,3));

wsp(:,1) = wsp(:,1)/maks1;
wsp(:,2) = wsp(:,2)/maks2;
wsp(:,3) = wsp(:,3)/maks3;

normT = wsp(1:5,:);
normC = wsp(6:10,:);
normS = wsp(11:15,:);

normT(normT<0) = 0;
normC(normC<0) = 0;
normS(normS<0) = 0;

end

