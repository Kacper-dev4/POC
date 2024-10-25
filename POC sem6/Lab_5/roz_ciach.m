function y = roz_ciach(x,bt,at)
[w,k] = size(x);
%a = min(x(:));
%b = max(x(:));
for i=1:w
for j=1:k

y(i,j) = round((((255.0)/(bt-at)) * ( x(i,j) - at)) +0);

end
end

y = uint8(y);

end
