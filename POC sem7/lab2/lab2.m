clear all

t1 = imread("tr1.png");
cir = imread("cir1.png");
kreski = imread("kreski.png");

%%%%%%% Zadanie 1 %%%%%%%%%%%%

j=0; % Zmienna wykorzystywana do wyświetlania w subplot
figure
for i=1:25:91  % Działa to tak najpier wyświetlamy obraz zrotowany o i-1 = 0 potem i + 25 -1 = 25 następnie i + 25 - 1 = 75 i koniec
    j=j+1;
    t1r=imrotate(t1,i-1,'crop');
    L1=fftshift(fft2(t1r));
    subplot(2,4,j)
    s1=strcat('kąt=',num2str(i-1));
    imshow(t1r,[])
    title(s1);
end
subplot(2,4,1)
ylabel('Trójkąty rotacja');
sc= int8(-150 + 250.*rand(4,2));

for i=1:4
    j=j+1;
    t1t=imtranslate(t1,sc(i,:));
    L1=fftshift(fft2(t1t));
    subplot(2,4,j)
    imshow(t1t,[])
end
subplot(2,4,5)
ylabel('Trójkąty translacja');

figure

j=0;

for i=1:4
    j=j+1;

    cirResize=imresize(cir,[512, 512]);

 
   % L3=fftshift(fft2(cirResize));
    subplot(2,4,j)
    imshow(cirResize,[])
    s1=strcat('k=',num2str(i-1));
    title(s1)
end

j=4; % Zmienna wykorzystywana do wyświetlania w subplot
for i=[1:45:91 , 121]  % Działa to tak najpier wyświetlamy obraz zrotowany o i-1 = 0 potem i + 25 -1 = 25 następnie i + 25 - 1 = 75 i koniec
    j=j+1;
    kreski1r=imrotate(kreski,i-1,'crop');
    L2=fftshift(fft2(kreski1r));
    subplot(2,4,j)
    s1=strcat('kąt=',num2str(i-1));
    imshow(kreski1r,[])
    title(s1);
end


