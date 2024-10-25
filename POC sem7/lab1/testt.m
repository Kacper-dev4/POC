clear all 
clc 

mat = [7,4,1;2,3,5;8,6,9];
wyj = mat(:);

zmiana = 1;
matLen = length(mat)^2;

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
