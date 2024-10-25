function [med] = media(img, n)

srodek = round((n^2)/2);
odl = floor(n/2);
med = img;

img = wsadz(img,odl);

[w,k,c] = size(img); 

for ch=1:c
    for i=odl+1:(w-odl)
        for j=odl+1:(k-odl)
            okno = (img(i-odl:i+odl,j-odl:j+odl,ch));
            uszeregowany = sorta(okno);
            med(i - odl,j-odl,ch) = uszeregowany(srodek);
            %med(i - odl,j-odl,ch) = median(okno(:));
        end

    end
end


% function [med] = media(img, n)
% 
% 
% odl = floor(n/2);
% med = img;
% 
% img = wsadz(img,odl);
% 
% [w,k,c] = size(img); 
% 
% for ch=1:c
%     for i=odl+1:(w-odl)
%         for j=odl+1:(k-odl)
%             okno = (img(i-odl:i+odl,j-odl:j+odl,ch));
%             med(i - odl,j-odl,ch) = median(okno(:));
%         end
% 
%     end
% end




