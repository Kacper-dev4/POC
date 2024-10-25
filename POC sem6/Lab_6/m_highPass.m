function out = m_highPass(img)

maska = fspecial('sobel');
out = uint8(conv2(double(img), maska, 'same'));


end

