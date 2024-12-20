clear all
clc
close all

% s1 = imread('obrazy\s1.png');
% s2 = imread('obrazy\s2.png');
% s3 = imread('obrazy\s3.png');
% s4 = imread('obrazy\s4.png');
% s5 = imread('obrazy\s5.png');
% 
% c1 = imread('obrazy\c1.png');
% c2 = imread('obrazy\c2.png');
% c3 = imread('obrazy\c3.png');
% c4 = imread('obrazy\c4.png');
% c5 = imread('obrazy\c5.png');
% 
% t1 = imread('obrazy\t1.png');
% t2 = imread('obrazy\t2.png');
% t3 = imread('obrazy\t3.png');
% t4 = imread('obrazy\t4.png');
% t5 = imread('obrazy\t5.png');

% Wczytanie zniekształconych obrazów

s1_edit = imread('obrazy\s1_edit.png');
%s1_edit = imread('obrazy\t1_edit.png');
c1_edit = imread('obrazy\c1_edit.png');

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
%t5 = imtranslate(t1, [100, -70]);
t5 = imtranslate(imrotate(t1,75,'bilinear','crop'), [100, -70]);

% t2 = imrotate(t1, 15 ,'bilinear','crop'); 
% t3 = imrotate(t1, 30,'bilinear','crop'); 
% t4 = imrotate(t1, 45,'bilinear','crop'); 
% t5 = imrotate(t1, 60,'bilinear','crop'); 

% Kwadraty
s2 = imresize(s1(1+n:512-n,1+n:512-n), 3, 'nearest');
s2 = imresize(s2,[512,512]);
s3 = imresize(s1(1+m:512-m,1+m:512-m), 3, 'nearest');
s3 = imresize(s3,[512,512]);
s4 = imrotate(s1, 30,'bilinear','crop'); 
%s5 = imtranslate(s1, [100, -150]); 
s5 = imtranslate(imrotate(s1,25,'bilinear','crop'), [100, -150]); 



% s2 = imtranslate(s1, [20, -30]); 
% s3 = imtranslate(s1, [-100, 30]); 
% s4 = imtranslate(s1, [40, 70]); 
% s5 = imtranslate(s1, [100, -150]); 

% Koła
c2 = imresize(c1(1+n:512-n,1+n:512-n), 3, 'nearest');
c2 = imresize(c2,[512,512]);
c3 = imresize(c1(1+m:512-m,1+m:512-m), 3, 'nearest');
c3 = imresize(c3,[512,512]);

c4 = imrotate(c1, 15,'bilinear','crop');
%c5 = imtranslate(c1, [150, 150]); 
c5 = imtranslate(imrotate(c1,10,'bilinear','crop'), [150, 150]); 



% c2 = imresize(c1(1+5:512-5,1+5:512-5), 3, 'nearest');
% c2 = imresize(c2,[512,512]);
% 
% c3 = imresize(c1(1+20:512-20,1+20:512-20), 3, 'nearest');
% c3 = imresize(c3,[512,512]);
% 
% c4 = imresize(c1(1+40:512-40,1+40:512-40), 3, 'nearest');
% c4 = imresize(c4,[512,512]);
% 
% c5 = imresize(c1(1+80:512-80,1+80:512-80), 3, 'nearest');
% c5 = imresize(c5,[512,512]);

 
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

%% Zad 3

[wspT, wspC, wspS] = wspWizualizacji(T,C,S);

doNormalizacji = [wspT;wspC;wspS];

[norm] = normalizacja(doNormalizacji);


normT = norm(1:5,:);
normC = norm(6:10,:);
normS = norm(11:15,:);


figure 
subplot(2,2,1)
hold on;
plot(normT(:,1),normT(:,2),'r^')
plot(normC(:,1),normC(:,2),'ko')
plot(normS(:,1),normS(:,2),'bs')
hold off;
xlim([0,1])
grid on
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')

subplot(2,2,2)
hold on;
plot(normT(:,2),normT(:,3),'r^')
plot(normC(:,2),normC(:,3),'ko')
plot(normS(:,2),normS(:,3),'bs')
hold off;
xlim([0,1])
grid on
xlabel('K2 - współczynnik Malinowskiej')
ylabel('K3 - współczynnik Mz')

subplot(2,2,3)
hold on;
plot(normT(:,1),normT(:,3),'r^')
plot(normC(:,1),normC(:,3),'ko')
plot(normS(:,1),normS(:,3),'bs')
hold off;
xlim([0,1])
grid on
xlabel('K1 - współczynnik kompaktowości')
ylabel('K3 - współczynnik Mz')

subplot(2,2,4)
hold on;
plot3(normT(:,1),normT(:,2),normT(:,3),'r^')
plot3(normC(:,1),normC(:,2),normC(:,3),'ko')
plot3(normS(:,1),normS(:,2),normS(:,3),'bs')
hold off;
grid on
view(3)
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')
zlabel('K3 - współczynnik Mz')

%% Zadanie 4 
C_edit = cat(3,C,c1_edit);
S_edit = cat(3,S,s1_edit);

tekstC_edit = liczWsp(C_edit);
tekstS_edit = liczWsp(S_edit);

figure
subplotuj(T,tekstT,1,3,6)
subplotuj(C_edit,tekstC_edit,2,3)
subplotuj(S_edit,tekstS_edit,3,3)

wspCe = wsp(C_edit);
wspSe = wsp(S_edit);

doNormalizacji_edit = [wspT;wspCe;wspSe];

[norm_edit] = normalizacja(doNormalizacji_edit);

normTe = norm_edit(1:5,:);
normCe = norm_edit(6:10,:);
normSe = norm_edit(12:16,:);

normC1e = norm_edit(11,:);
normS1e = norm_edit(17,:);


for k=[1,3,5,7]
[odle,med,indeks,klasyfikacja] = kNN(normS1e(1,1:2), norm_edit(:,1:2), k);

klasyfikacja

figure
hold on 
hold on;
plot(normTe(:,1),normTe(:,2),'r^')
plot(normCe(:,1),normCe(:,2),'go')
plot(normSe(:,1),normSe(:,2),'bs')

plot(normS1e(1,1),normS1e(1,2),'ks')

plot(normC1e(1,1),normC1e(1,2),'ko')

for i = indeks
    plot([normS1e(1,1), norm_edit(i,1)], [normS1e(1,2), norm_edit(i,2)], 'k--', 'LineWidth', 1.5);
end

hold off;
xlim([0,1])
grid on
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')
title(klasyfikacja);

end

for k=[1,3,5,7]
[odle,med,indeks,klasyfikacja] = kNN(normC1e(1,1:2), norm_edit(:,1:2), k);

klasyfikacja

figure
hold on 
hold on;
plot(normTe(:,1),normTe(:,2),'r^')
plot(normCe(:,1),normCe(:,2),'go')
plot(normSe(:,1),normSe(:,2),'bs')
plot(normC1e(1,1),normC1e(1,2),'ko')

plot(normS1e(1,1),normS1e(1,2),'ks')

for i = indeks
    plot([normC1e(1,1), norm_edit(i,1)], [normC1e(1,2), norm_edit(i,2)], 'k--', 'LineWidth', 1.0);
end

hold off;
xlim([0,1])
grid on
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')
title(klasyfikacja);

end


[odle,med,indeks,klasyfikacja] = kNN(normS1e, norm_edit, 3);

figure
hold on;
plot3(normT(:,1),normT(:,2),normT(:,3),'r^')
plot3(normC(:,1),normC(:,2),normC(:,3),'go')
plot3(normS(:,1),normS(:,2),normS(:,3),'bs')

plot3(normC1e(1,1),normC1e(1,2),normC1e(1,3),'ko')

plot3(normS1e(1,1),normS1e(1,2),normS1e(1,3),'ks')

for i = indeks
    plot3([normS1e(1,1), norm_edit(i,1)], [normS1e(1,2), norm_edit(i,2)], [normS1e(1,3), norm_edit(i,3)], 'k--', 'LineWidth', 1.0);
end

hold off;
grid on
view(3)
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')
zlabel('K3 - współczynnik Mz')
title(klasyfikacja)


[odle,med,indeks,klasyfikacja] = kNN(normC1e, norm_edit, 3);

figure
hold on;
plot3(normT(:,1),normT(:,2),normT(:,3),'r^')
plot3(normC(:,1),normC(:,2),normC(:,3),'go')
plot3(normS(:,1),normS(:,2),normS(:,3),'bs')

plot3(normC1e(1,1),normC1e(1,2),normC1e(1,3),'ko')

plot3(normS1e(1,1),normS1e(1,2),normS1e(1,3),'ks')

for i = indeks
    plot3([normC1e(1,1), norm_edit(i,1)], [normC1e(1,2), norm_edit(i,2)], [normC1e(1,3), norm_edit(i,3)], 'k--', 'LineWidth', 1.0);
end

hold off;
grid on
view(3)
xlabel('K1 - współczynnik kompaktowości')
ylabel('K2 - współćżynnik Malinowskiej')
zlabel('K3 - współczynnik Mz')
title(klasyfikacja)

