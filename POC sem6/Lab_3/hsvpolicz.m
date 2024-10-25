% function ile = hsvpolicz(img)
% 
% byly = zeros(9999);
% ile = 0;
% 
%  img(:,:,1) = round(img(:,:,1)*10000)/10000;
%  img(:,:,1) = img(:,:,1)*10000;
% 
%  [wiersze,kolumny,~] = size(img);
% 
% for w=1:wiersze
%     for k=1:kolumny
%     indeks = img(w,k,1);
%     byly(indeks) = 1;
%     end
% end
% 
% for i=1:9999
% 
% if(byly(i) == 1)
% ile = ile + 1;
% end
% end
% 
% 
% 
% end


function ile = hsvpolicz(img)

byly = zeros(360,256,256);
ile = 0;
[wiersze,kolumny,~] = size(img);
img(:,:,1) = uint8(img(:,:,1)*360);
img(:,:,2) = uint8(img(:,:,2)*255);
img(:,:,3) = uint8(img(:,:,3)*255);
for w=1:wiersze
    for k=1:kolumny
    h = img(w,k,1);
    s = img(w,k,2);
    v = img(w,k,3);
    
    byly((uint16(h)+1),(uint16(s)+1),(uint16(v)+1)) = 1;
   % byly(h+1,s+1,v+1) = 1;
    end
end


for kan=1:256
    for w=1:360
        for k=1:256
        if(byly(w,k,kan)==1)
        ile = ile + 1;
        end


        end
    end
end


end


