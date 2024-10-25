function ile = licz(img)

byly = zeros(256,256,256);
ile = 0;
[wiersze,kolumny,~] = size(img);

for w=1:wiersze
    for k=1:kolumny
    r = img(w,k,1);
    g = img(w,k,2);
    b = img(w,k,3);
    byly((uint16(r)+1),(uint16(g)+1),(uint16(b)+1)) = 1;
    end
end


for kan=1:256
    for w=1:256
        for k=1:256
        if(byly(w,k,kan)==1)
        ile = ile + 1;
        end


        end
    end
end


end

