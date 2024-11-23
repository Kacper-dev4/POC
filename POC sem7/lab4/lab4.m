clear all
clc
close all


% Wczytanie podstawowych obrazów
t1 = imread('obrazy\t5.png');
s1 = imread('obrazy\s1.png');
c1 = imread('obrazy\c1.png');


%% Zad 1 i 2a
n = 40;
m = 80;
% Generowanie obrazów z modyfikacjami
% Trójkąty
t2 = imresize(t1(1+n:512-n,1+n:512-n), 3, 'nearest');
t2 = imresize(t2,[512,512]);
t3 = imresize(t1(1+m:512-m,1+m:512-m), 3, 'nearest');
t3 = imresize(t3,[512,512]);
t4 = imrotate(t1, 45,'bilinear','crop'); 
t5 = imtranslate(t1, [100, -70]);

% Kwadraty
s2 = imresize(s1(1+n:512-n,1+n:512-n), 3, 'nearest');
s2 = imresize(s2,[512,512]);
s3 = imresize(s1(1+m:512-m,1+m:512-m), 3, 'nearest');
s3 = imresize(s3,[512,512]);
s4 = imrotate(s1, 30,'bilinear','crop'); 
s5 = imtranslate(s1, [100, -150]); 


% Koła
c2 = imresize(c1(1+n:512-n,1+n:512-n), 3, 'nearest');
c2 = imresize(c2,[512,512]);
c3 = imresize(c1(1+m:512-m,1+m:512-m), 3, 'nearest');
c3 = imresize(c3,[512,512]);

c4 = imrotate(c1, 15,'bilinear','crop');
c5 = imtranslate(c1, [150, 150]); 
 

 
S = cat(3,s1,s2,s3,s4,s5);
tekstS = liczWsp(S);

C = cat(3,c1,c2,c3,c4,c5);
tekstC = liczWsp(C);

T = cat(3,t1,t2,t3,t4,t5);
tekstT = liczWsp(T);

figure
subplotuj(T,tekstS,1,3);
subplotuj(C,tekstC,2,3);
subplotuj(S,tekstS,3,3);

% s1 = imbinarize(s1);
% 
% staty = regionprops(s1,'Centroid');
% 
% centrum = staty.Centroid;




%% Zad 2b

wykresy(t1,c1,s1);

