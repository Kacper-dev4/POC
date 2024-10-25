function out = maska(img,maseczka)

[w,k,~] = size(img);

[n,m] = size(maseczka);

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
img = double(img);
 for i=(ile_n+1):(w-ile_n)
    
     for j=(ile_m+1):(k-ile_m)
    
    block = img(i-ile_n:i+ile_n, j-ile_m:j+ile_m);
    block = block.*maseczka;
    dzielnik = sum(maseczka(:));
   % if(dzielnik==0)
   % dzielnik = 1;
  %end
    out(i,j) = (1/dzielnik)*sum(block(:)) ;
    
    end


 end
