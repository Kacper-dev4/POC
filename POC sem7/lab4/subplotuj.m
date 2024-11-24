function [] = subplotuj(obrazy, teksty, wiersz, wiersze,kolumny)

[~,~,dlu] = size(obrazy);
if nargin < 5 
kolumny = dlu;
end
    for i=1:dlu
        subplot(wiersze,kolumny,i+(dlu*(wiersz-1)))
        imshow(obrazy(:,:,i))
        title(teksty{i});
    end

end

