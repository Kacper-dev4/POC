function [out] = liczOdle(in)
Wie = 1;
Kol = 1;
sumki = zeros(3,3);
sumy = zeros(9,1);
img = double(in);
    for i=1:9
        w = 1;
        k = 1;
        for j=1:9

            sumy(i) = sumy(i) + abs(img(Wie,Kol,1) - img(w,k,1)) + abs(img(Wie,Kol,2) - img(w,k,2)) + abs(img(Wie,Kol,3) - img(w,k,3));
            if k == 3
                k = 1;
                w = w+1;
            else
                k =k+1;
            end
        end
            sumki(Wie,Kol) = sumy(i);
            if Kol == 3
                Kol = 1;
                Wie = Wie+1;
            else
                Kol = Kol+1;
            end
    end
mini = min(sumki(:));
for ww=1:3
    for kk=1:3
        if sumki(ww,kk) == mini
         out = in(ww,kk,:);
        end
    end
end


