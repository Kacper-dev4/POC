function ile = liczhsv(img)

byly = zeros(256,256,256);
ile = 0;
[wiersze,kolumny,~] = size(img);
img = uint8(img*255);
for w=1:wiersze
    for k=1:kolumny
    h = img(w,k,1);
    s = img(w,k,2);
    v = img(w,k,3);
    
    byly((uint16(h)+1),(uint16(s)+1),(uint16(v)+1)) = 1;
   % byly(h+1,s+1,v+1) = 1;
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



