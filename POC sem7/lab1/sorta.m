function [wyj] = sorta(mat)

wyj = mat(:);

zmiana = 1;
matLen = length(wyj);

while(zmiana)
    zmiana = 0;
    for i=1:matLen-1
        if wyj(i) > wyj(i+1)
            pom = wyj(i+1);
            wyj(i+1) = wyj(i);
            wyj(i) = pom;
            zmiana = 1;
        end
    
    end
end


end

