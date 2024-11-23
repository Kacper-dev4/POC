clear all
clc
close all


sMid = imread('obrazy\squareMiddle.png');

sMid = imbinarize(sMid);

staty = regionprops(sMid,'Centroid');

centrum = staty.Centroid;