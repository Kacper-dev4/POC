function newpixel = find_palette(oldpixel)

[~,~,kanaly] = size(oldpixel);

if(kanaly==1)

%newpixel = zeros(1,1);
%newpixel(1,1,1) = uint8(round(double(oldpixel(1,1,1)/(255/1))) * (255/1));
newpixel = round(double(oldpixel) / (255)) * (255);


end
end

