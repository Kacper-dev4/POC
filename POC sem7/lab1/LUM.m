
function [out] = LUM(img,n,k)

out = img;
dlugosc = n*n;
%srodek = round((n^2)/2);
[w,kol,c] = size(img);
odl = floor(n/2);

for ch=1:c
    for i=odl+1:(w-odl)
        for j=odl+1:(kol-odl)
            okno = (img(i-odl:i+odl,j-odl:j+odl,ch));
            uszeregowany = sorta(okno);
            zostaje = 0;
            for ii=(1+k):(dlugosc-k)
                if img(i,j,ch) == uszeregowany(ii)
                    zostaje = 1;
                end
            end
            if zostaje == 0 && img(i,j,ch) <= uszeregowany(1+k)
                out(i,j,ch) = uszeregowany(1+k);
            end

            if zostaje == 0 && img(i,j,ch) >= uszeregowany(dlugosc-k)
                out(i,j,ch) = uszeregowany(dlugosc-k);
            end
        end

    end

end




% function [out] = LUM(img,n,k)
% 
% out = img;
% srodek = round((n^2)/2);
% [w,kol,c] = size(img);
% odl = floor(n/2);
% 
% for ch=1:c
%     for i=odl+1:(w-odl)
%         for j=odl+1:(kol-odl)
%             okno = (img(i-odl:i+odl,j-odl:j+odl,ch));
%             uszeregowany = sorta(okno);
%             zostaje = 0;
%             for ii=(srodek-k):(srodek+k)
%                 if img(i,j,ch) == uszeregowany(ii)
%                     zostaje = 1;
%                 end
%             end
%             if zostaje == 0 && img(i,j,ch) < uszeregowany(srodek-k)
%                 out(i,j,ch) = uszeregowany(srodek-k);
%             end
% 
%             if zostaje == 0 && img(i,j,ch) > uszeregowany(srodek+k)
%                 out(i,j,ch) = uszeregowany(srodek+k);
%             end
%         end
% 
%     end
% 
% end
% 
