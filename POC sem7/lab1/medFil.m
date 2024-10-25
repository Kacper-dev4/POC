function out = medFil(in)

[~,~,ch] = size(in);

for c=1:ch
  out(:,:,c) = medfilt2(in(:,:,c));  
end


end

