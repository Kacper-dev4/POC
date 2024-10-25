

function out = bilirb(input)

[rows, cols] = size(input);
out = uint8(zeros(rows,cols));

for i = 2:rows-1
for j = 2:cols-1
       
Sample = input(i-1:i+1,j-1:j+1);
        
if Sample(2,1) == 0 && Sample(1,2) == 0 && Sample(2,2) == 0
            
out(i,j) = round(sum(Sample(:))/4); 
out(i-1, j) = round(sum(Sample(1,:))/2);
out(i+1, j) = round(sum(Sample(3,:))/2);
out(i, j-1) = round(sum(Sample(:,1))/2);
out(i, j+1) = round(sum(Sample(:,3))/2);
elseif Sample(1,2) ~= 0
out(i,j) = round(sum(Sample(:,2))/2);
elseif Sample(2,1) ~= 0
out(i,j) = round(sum(Sample(2,:))/2);
else
out(i,j) = Sample(2,2);
end         
end
end

end
