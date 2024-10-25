%          [ -1 -1 -1 ]
%  maska = | -1  9 -1 |
%          [ -1 -1 -1 ]
function out = gorny(img)

[w,k,~] = size(img);

out = img;
img = double(img);
 for i=2:(w-1)
    
     for j=2:(k-1)
    
    block = img(i-1:i+1, j-1:j+1);
    out(i,j) = 10*img(i,j)-sum(block(:)) ;
    end


 end


end



