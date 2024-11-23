clear all
clc
close all


s1 = imread('obrazy\s1.png');
s2 = imread('obrazy\s2.png');
s3 = imread('obrazy\s3.png');
s4 = imread('obrazy\s4.png');
s5 = imread('obrazy\s5.png');

tes1 = sprintf('k1: k2: k3');
tes2 = sprintf('k1: k2: k3');
tes3 = sprintf('k1: k2: k3');
tes4 = sprintf('k1: k2: k3');
tes5 = sprintf('k1: k2: k3');

S(:,:,1) = s1; 
S(:,:,2) = s2; 
S(:,:,3) = s3; 
S(:,:,4) = s4; 
S(:,:,5) = s5; 
tekstS = {tes1;tes2;tes3;tes4;tes5};


figure
subplotuj(S,tekstS,1,1);

% s1 = imbinarize(s1);
% 
% staty = regionprops(s1,'Centroid');
% 
% centrum = staty.Centroid;