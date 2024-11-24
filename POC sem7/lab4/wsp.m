function [wspT] = wsp(T)

[~,~,dlu] = size(T);
    for i=1:dlu
        
        wspT(i,1) = wspK(T(:,:,i));
        wspT(i,2) = wspMalin(T(:,:,i));
        wspT(i,3) = wspMz(T(:,:,i));

    end

end

