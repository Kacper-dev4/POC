clear all
img=imread("Bayer\CFA_sRGB\cienkopisy_srgb_CFA.png");

[R,G,B] =splitColors(img);


cat(3,R,G,B);
imshow(ans)