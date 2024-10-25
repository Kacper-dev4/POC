% Funkcja służąca do interpolacji metodą najbliższego sąsiada
function returnedImage = nn(A)
% Rozmiary obrazu 
[rows, cols] = size(A);


returnedImage = uint8(zeros(rows,cols));

for i = 1:rows-1
    for j = 1:cols-1
        Sample = A(i:i+1,j:j+1);
        if Sample(1,1) ~= 0
            returnedImage(i,j) = Sample(1,1);
        end
          if Sample(1,2) ~= 0
              returnedImage(i,j) = Sample(1,2);
          end
          if Sample(2,1) ~= 0
              returnedImage(i,j) = Sample(2,1);
          end
          if Sample(2,2) ~= 0
              returnedImage(i,j) = Sample(2,2);
          end
    
    end  
            
        end
    end


