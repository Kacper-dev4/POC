function [A0] = wsadz(A,g)


% Tworzenie nowej macierzy z zerami o wymiarach powiększonych o 2*g
[row, col, z] = size(A);
A0 = zeros(row + 2*g, col + 2*g,z);
% Umieszczenie macierzy A w środku nowej macierzy

for ch=1:z
A0(g+1:end-g, g+1:end-g,ch) = A(:,:,ch);
end

end

