function out = g_prostokat(img,n,m)

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
img = double(img);
 for i=(ile_n+1):(w-ile_n)
    
     for j=(ile_m+1):(k-ile_m)
    
    block = img(i-ile_n:i+ile_n, j-ile_m:j+ile_m);
    [w_block, k_block] = size(block);
    licz_elementy = numel(block);
    maska = ones(w_block,k_block)*(-1);
    srodek_w = ceil(w_block / 2);
    srodek_k = ceil(k_block / 2); 
    maska(srodek_w,srodek_k) = (licz_elementy);
    block = block.*maska;
    out(i,j) = sum(block(:)) ;
    end


 end

end