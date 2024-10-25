
function out = kwadrat(img,n)

[w,k,~] = size(img);
ile = 0;
sprawdz = n;
while(sprawdz>2)

sprawdz = sprawdz - 2;
ile = ile + 1;

end


out = img;

 for i=(ile+1):(w-ile)

     for j=(ile+1):(k-ile)

    block = img(i-ile:i+ile, j-ile:j+ile);
    out(i,j) = (1/(n^2))*sum(block(:));

    end


 end


end


