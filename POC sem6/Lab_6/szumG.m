function out = szumG(img)


mean = 0; 
variance = 0.01; 

noisyImage = imnoise(double(img) / 255, 'gaussian', mean, variance);


out = uint8(noisyImage * 255);

end

