function [p1,p2,p10] = szumy(img)

p1 = imnoise(img,'salt & pepper',0.01);
p2 = imnoise(img,'salt & pepper',0.02);
p10 = imnoise(img,'salt & pepper',0.1);

imz=[img(250:400,250:400,:),p1(250:400,250:400,:),p2(250:400,250:400,:),p10(250:400,250:400,:)];
ima=imresize(imz,3,'nearest');

imshow(ima)

end

