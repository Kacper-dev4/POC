function out = m_lowPass(img,n,m)

maska = fspecial('average', [n m]);
out = uint8(conv2(double(img), maska, 'same'));

end

