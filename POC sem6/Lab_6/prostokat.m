
function out = prostokat(img,n,m)

[w,k,~] = size(img);
ile_n = 0;
sprawdz_n = n;
while(sprawdz_n>2)

sprawdz_n = sprawdz_n - 2;
ile_n = ile_n + 1;

end

ile_m = 0;
sprawdz_m = m;
while(sprawdz_m>2)

sprawdz_m = sprawdz_m - 2;
ile_m = ile_m + 1;

end



out = img;

 for i=(ile_n+1):(w-ile_n)

     for j=(ile_m+1):(k-ile_m)

    block = img(i-ile_n:i+ile_n, j-ile_m:j+ile_m);
    out(i,j) = (1/(n*m))*sum(block(:));

    end


 end


end



