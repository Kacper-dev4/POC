function [out] = VMFL2(img)

n = 3;
odl = floor(n/2);
out = img;
img = wsadz(img,odl);


[w,k,~] = size(img); 


    for i=odl+1:(w-odl)
        for j=odl+1:(k-odl)

            okno = (img(i-odl:i+odl,j-odl:j+odl,:));
            ktory = L2(okno);
            out(i-odl,j-odl,:) = ktory;
            
        end
    end
