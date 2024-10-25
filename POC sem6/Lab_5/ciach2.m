function y = ciach2(x,t)
[w,k] = size(x);

%ileMin =t;

ilePix = w*k;
procent = t;
ileMin = ilePix * procent;

hist = imhist(x);



for i = 1:256

    if  hist(i) >= ileMin
        low  = double(i);
        break;
    end

end


for i = 256:-1:1

    if hist(i) >= ileMin
        high = double(i);
        break;
    end

end

a = low;
b = high;

x = double(x);

    for i=1:w
        for j=1:k

        y(i,j) = ((255.0-0.0)/double(b-a)) * ( x(i,j) - a) + 0.0;

        end
    end

y = uint8(y);

end


