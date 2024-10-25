function y = rozciag(x)
[w,k] = size(x);
a = min(x(:));
b = max(x(:));

x = double(x);

    for i=1:w
        for j=1:k

        y(i,j) = ((255.0-0.0)/double(b-a)) * ( x(i,j) - a) + 0.0;

        end
    end

y = uint8(y);

end

