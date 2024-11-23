function [] = subplotuj(obrazy, teksty, wiersz, wiersze)

[~,~,dlu] = size(obrazy);

    for i=1:dlu
        subplot(wiersze,dlu,i+(dlu*(wiersz-1)))
        imshow(obrazy(:,:,i))
        title(teksty{i});
    end

end

