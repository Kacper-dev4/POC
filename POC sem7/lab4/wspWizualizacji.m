function [wspT,wspC,wspS] = wspWizualizacji(T,C,S)

[~,~,dlu] = size(T);
    for i=1:dlu
        
        wspT(i,1) = wspK(T(:,:,i));
        wspT(i,2) = wspMalin(T(:,:,i));
        wspT(i,3) = wspMz(T(:,:,i));

        wspC(i,1) = wspK(C(:,:,i));
        wspC(i,2) = wspMalin(C(:,:,i));
        wspC(i,3) = wspMz(C(:,:,i));

        wspS(i,1) = wspK(S(:,:,i));
        wspS(i,2) = wspMalin(S(:,:,i));
        wspS(i,3) = wspMz(S(:,:,i));


    end

end

