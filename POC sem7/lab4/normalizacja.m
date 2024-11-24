function [norm] = normalizacja(wsp)

maks1 = max(wsp(:,1));
maks2 = max(wsp(:,2));
maks3 = max(wsp(:,3));

wsp(:,1) = wsp(:,1)/maks1;
wsp(:,2) = wsp(:,2)/maks2;
wsp(:,3) = wsp(:,3)/maks3;

wsp(wsp<0) = 0;

norm = wsp;



end

