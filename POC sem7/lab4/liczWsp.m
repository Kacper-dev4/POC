function [teksty] = liczWsp(obrazy)

[~,~,dlu] = size(obrazy);
teksty = {1:dlu};
    for i=1:dlu
        k = wspK(obrazy(:,:,i));
        M = wspMalin(obrazy(:,:,i));
        Mz = wspMz(obrazy(:,:,i));
        teksty{i} = sprintf("k1: %.2f k1: %.2f k3: %.2f", k, M, Mz);
    end
end

