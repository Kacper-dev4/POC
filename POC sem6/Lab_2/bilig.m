

function out = bilig(input)

[rows, cols] = size(input);
 out = uint8(zeros(rows,cols));


for i = 2:rows-1
for j = 2:cols-1
      
Sample = input(i-1:i+1,j-1:j+1);
        
if Sample(2,2) == 0
          
out(i,j) = round(sum(Sample(:))/4) ;
else
out(i,j) = Sample(2,2);
end         
end
end

end