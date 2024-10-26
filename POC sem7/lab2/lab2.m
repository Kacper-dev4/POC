clear all

t1 = imread("tr1.png");
cir = imread("cir1.png");
kreski = imread("kreski.png");
grayImage = imread("bridge_512x512.bmp");

%%%%%%% Zadanie 1 %%%%%%%%%%%%


%%%%%%% Przykład trójkąt %%%%%%%%%%%%


j=0; % Zmienna wykorzystywana do wyświetlania w subplot
figure
for i=1:25:91  % Działa to tak najpier wyświetlamy obraz zrotowany o i-1 = 0 potem i + 25 -1 = 25 następnie i + 25 - 1 = 75 i koniec
    j=j+1;
    t1r=imrotate(t1,i-1,'crop');
    %L1=fftshift(fft2(t1r));
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
    %L1=fftshift(fft2(t1t));
    subplot(2,4,j)
    imshow(t1t,[])
end
subplot(2,4,5)
ylabel('Trójkąty translacja');


%%%%%%%%%% Przykład koła i linie %%%%%%%%%%%%%%%%%
figure
j=0;
n = 0;
for i=1:4
    j=j+1;

    cirResize=imresize(cir(1+n:512-n,1+n:512-n), 3, 'nearest');
   
    n = 69* j; 
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

figure
n = 50;
imshow(imresize(cir(1+n:512-n,1+n:512-n), 3, 'nearest')) 


%%%%%%%%% Przykład sinus %%%%%%%%%%

a=10*[1 -1 2 -4000];
b=5* [1 1 4 2];
subtitle('Sinus');
j=0;
for i=1:4
for u = 1:512
for v=1:512
a1(u,v)=uint8(127+128*sin(u/a(i)+v/b(i)));
end
end
j=j+1;
subplot(1,4,j)
s1=strcat('a,b=',num2str(a(i)),',',num2str(b(i))) ;
imshow(a1,[])
title(s1);
end


%%%%%% Zadanie 2 %%%%%%%%%%%%



% L1=fftshift(fft2(g1));
% imshow(log(1+abs(L1)),[]);
% xlabel('Widmo mocy');
% 
% imshow(angle(L1),[]);
% xlabel('Faza');

%%%%%%% Trójkąt rotacja %%%%%%%%%%%
j=0; % Zmienna wykorzystywana do wyświetlania w subplot
figure
for i=1:25:91  % Działa to tak najpier wyświetlamy obraz zrotowany o i-1 = 0 potem i + 25 -1 = 25 następnie i + 25 - 1 = 75 i koniec
    j=j+1;
    t1r=imrotate(t1,i-1,'crop');
    L1=fftshift(fft2(t1r));
    subplot(3,4,j)
    s1=strcat('kąt=',num2str(i-1));
    imshow(t1r,[])
    title(s1);

    subplot(3,4,j+4)
    imshow(log(1+abs(L1)),[]);
    
    subplot(3,4,j+8)
    imshow(angle(L1),[]);
    
end
subplot(3,4,1)
ylabel('Trójkąty rotacja');

subplot(3,4,5)
ylabel('Widmo mocy');

subplot(3,4,9)
ylabel('Faza');

%%%%%%% Trójkąt translacja %%%%%%%%

sc= int8(-150 + 250.*rand(4,2));
j = 0;
figure
for i=1:4
    j=j+1;
    t1t=imtranslate(t1,sc(i,:));
    L1=fftshift(fft2(t1t));
    subplot(3,4,j)
    imshow(t1t,[])

    subplot(3,4,j+4)
    imshow(log(1+abs(L1)),[]);
    
    subplot(3,4,j+8)
    imshow(angle(L1),[]);
end
subplot(3,4,5)
ylabel('Trójkąty translacja');

subplot(3,4,5)
ylabel('Widmo mocy');

subplot(3,4,9)
ylabel('Faza');

%%% Koła %%%%%%%%%%%%

figure
j=0;
n = 0;
for i=1:4
    j=j+1;

    cirResize=imresize(cir(1+n:512-n,1+n:512-n), 3, 'nearest');
   
    n = 69* j; 
   % L3=fftshift(fft2(cirResize));
    subplot(3,4,j)
    imshow(cirResize,[])
    s1=strcat('k=',num2str(i-1));
    title(s1)

    L1=fftshift(fft2(cirResize));
   
    subplot(3,4,j+4)
    imshow(log(1+abs(L1)),[]);
    
    subplot(3,4,j+8)
    imshow(angle(L1),[]);
end

subplot(3,4,5)
ylabel('Widmo mocy');

subplot(3,4,9)
ylabel('Faza');

%%%%% Linie %%%%%%%%%%%
figure
j=0; % Zmienna wykorzystywana do wyświetlania w subplot
for i=[1:45:91 , 121]  % Działa to tak najpier wyświetlamy obraz zrotowany o i-1 = 0 potem i + 25 -1 = 25 następnie i + 25 - 1 = 75 i koniec
    j=j+1;
    kreski1r=imrotate(kreski,i-1,'crop');
    L2=fftshift(fft2(kreski1r));
    subplot(3,4,j)
    s1=strcat('kąt=',num2str(i-1));
    imshow(kreski1r,[])
    title(s1);

    L1=fftshift(fft2(kreski1r));
   
    subplot(3,4,j+4)
    imshow(log(1+abs(L1)),[]);
    
    subplot(3,4,j+8)
    imshow(angle(L1),[]);
end

subplot(3,4,5)
ylabel('Widmo mocy');

subplot(3,4,9)
ylabel('Faza');
%%%% Sinusoida %%%%%%%%%
figure
a=10*[1 -1 2 -4000];
b=5* [1 1 4 2];
subtitle('Sinus');
j=0;
for i=1:4
for u = 1:512
for v=1:512
a1(u,v)=uint8(127+128*sin(u/a(i)+v/b(i)));
end
end
j=j+1;
subplot(3,4,j)
s1=strcat('a,b=',num2str(a(i)),',',num2str(b(i))) ;
imshow(a1,[])
title(s1);

L1=fftshift(fft2(a1));
   
    subplot(3,4,j+4)
    imshow(log(1+abs(L1)),[]);
    
    subplot(3,4,j+8)
    imshow(angle(L1),[]);

end

subplot(3,4,5)
ylabel('Widmo mocy');

subplot(3,4,9)
ylabel('Faza');
%%%%%%%%% Zadanie 3 %%%%%%%%%%%%%%%%

%%%%%% Filtracja dolno przepustowa %%%%%%%

h = fspecial('gaussian',[5,5],1);

j = 1;
figure
subplot(2,5,1)
imshow(grayImage,[])
title('O1')
subplot(2,5,6)
L1=fftshift(fft2(grayImage));
imshow(log(1+abs(L1)),[]);
for i=1:10
    if i==1
    amf = imfilter(grayImage,h,'replicate');
    else
     amf = imfilter(amf,h,'replicate');
    end
    if i==1 || i==2 || i==5 || i==10
        j = j+1;
        s1=strcat('AMF iteracja=',num2str(i));
        subplot(2,5,j)
        imshow(amf,[])
        title(s1)
        subplot(2,5,j+5)
        L1=fftshift(fft2(amf));
        imshow(log(1+abs(L1)),[]);

    end
end

%%%%%% Filtracja górno przepustowa %%%%%%%

maska = [-1,-1,-1;0,0,0;1,1,1];
%maska = [-1,2,-1];
%maska = [1,2,1;0,0,0;-1,-2,-1];
%maska = [-1,0,1;-2,0,2;-1,0,1];
%h = fspecial('unsharp');

j = 1;
figure
subplot(2,5,1)
imshow(grayImage,[])
title('O1')
subplot(2,5,6)
L1=fftshift(fft2(grayImage));
imshow(log(1+abs(L1)),[]);
for i=1:10
    
    if i==1
        %amf = imfilter(grayImage,h,'replicate');
        amf = imfilter(grayImage,maska);
    else
        %amf = imfilter(amf,h,'replicate');
        amf = imfilter(amf,maska);
    end
    
    if i==1 || i==2 || i==5 || i==10
        j = j+1;
        s1=strcat('Iteracja=',num2str(i));
        subplot(2,5,j)
        imshow(amf,[])
        title(s1)
        subplot(2,5,j+5)
        L1=fftshift(fft2(amf));
        imshow(log(1+abs(L1)),[]);

    end
end

%%%%%% Zadanie 4 %%%%%%%%%%%%%%

%%%% Filtracja dolno przepustowa w dziedzinie częstotliwości !!! %%%%%%%%%


% Obraz wejściowy
figure
subplot(2,5,1)
imshow(grayImage, [])
title('Obraz wejściowy')

% Transformacja Fouriera z przesunięciem widma
FFT2 = fftshift(fft2(grayImage));
FFT2ABS = log(1 + abs(FFT2));

% Wyświetlenie widma mocy
subplot(2,5,2)
imshow(FFT2ABS, [])
title('Widmo mocy')

% Tworzenie maski dolnoprzepustowej 
dolno = bialeKolko(50); 

subplot(2,5,3)
imshow(dolno, [])
title('Maska dolnoprzepustowa')

% Zastosowanie maski dolnoprzepustowej na przesuniętym widmie
FFT2_filtered = FFT2 .* dolno;

% Widmo po zastosowaniu maski
filteredFFT2ABS = log(1 + abs(FFT2_filtered));

subplot(2,5,4)
imshow(filteredFFT2ABS, [])
title('maska * |FFT2|')

% Odwrotna transformacja Fouriera
odwrot = ifft2(ifftshift(FFT2_filtered)); % `ifftshift` usuwa przesunięcie widma

% Wyświetlenie przefiltrowanego obrazu
subplot(2,5,5)
imshow(real(odwrot), [])
title('Obraz po filtracji dolnoprzepustowej')

% Obraz wejściowy

subplot(2,5,6)
imshow(grayImage, [])
title('Obraz wejściowy')

% Transformacja Fouriera z przesunięciem widma
FFT2 = fftshift(fft2(grayImage));
FFT2ABS = log(1 + abs(FFT2));

% Wyświetlenie widma mocy
subplot(2,5,7)
imshow(FFT2ABS, [])
title('Widmo mocy')

% Tworzenie maski dolnoprzepustowej 
dolno =   fspecial('gaussian',[512,512],50);
subplot(2,5,8)
imshow(dolno, [])
title('Maska dolnoprzepustowa')

% Zastosowanie maski dolnoprzepustowej na przesuniętym widmie
FFT2_filtered = FFT2 .* dolno;

% Widmo po zastosowaniu maski
filteredFFT2ABS = log(1 + abs(FFT2_filtered));

subplot(2,5,9)
imshow(filteredFFT2ABS, [])
title('maska * |FFT2|')

% Odwrotna transformacja Fouriera
odwrot = ifft2(ifftshift(FFT2_filtered)); % `ifftshift` usuwa przesunięcie widma

% Wyświetlenie przefiltrowanego obrazu
subplot(2,5,10)
imshow(real(odwrot), [])
title('Obraz po filtracji dolnoprzepustowej')


%%%%%%%%% Filtracja górnoprzepustowa w dziedzinie częstotliwości %%%%%%%%


% Obraz wejściowy
figure
subplot(2,5,1)
imshow(grayImage, [])
title('Obraz wejściowy')

% Transformacja Fouriera z przesunięciem widma
FFT2 = fftshift(fft2(grayImage));
FFT2ABS = log(1 + abs(FFT2));

% Wyświetlenie widma mocy
subplot(2,5,2)
imshow(FFT2ABS, [])
title('Widmo mocy')

% Tworzenie maski górnoprzepustowej 
gorno = czarneKolko(25); 

subplot(2,5,3)
imshow(gorno, [])
title('Maska górnoprzepustowa')

% Zastosowanie maski górnoprzepustowej na przesuniętym widmie
FFT2_filtered = FFT2 .* gorno;

% Widmo po zastosowaniu maski
filteredFFT2ABS = log(1 + abs(FFT2_filtered));

subplot(2,5,4)
imshow(filteredFFT2ABS, [])
title('maska * |FFT2|')

% Odwrotna transformacja Fouriera
odwrot = ifft2(ifftshift(FFT2_filtered)); % `ifftshift` usuwa przesunięcie widma

% Wyświetlenie przefiltrowanego obrazu
subplot(2,5,5)
imshow(real(odwrot), [])
title('Obraz po filtracji górnoprzepustowej')

% Obraz wejściowy

subplot(2,5,6)
imshow(grayImage, [])
title('Obraz wejściowy')

% Transformacja Fouriera z przesunięciem widma
FFT2 = fftshift(fft2(grayImage));
FFT2ABS = log(1 + abs(FFT2));

% Wyświetlenie widma mocy
subplot(2,5,7)
imshow(FFT2ABS, [])
title('Widmo mocy')

% Tworzenie maski górnoprzepustowej 
%gorno =   fspecial('gaussian',[512,512],35);
%gorno = -gorno;
%gorno(256, 256) = gorno(256, 256) + 1;

gorno = czarneKolko(10);
subplot(2,5,8)
imshow(gorno, [])
title('Maska górnoprzepustowa')

% Zastosowanie maski dolnoprzepustowej na przesuniętym widmie
FFT2_filtered = FFT2 .* gorno;

% Widmo po zastosowaniu maski
filteredFFT2ABS = log(1 + abs(FFT2_filtered));

subplot(2,5,9)
imshow(filteredFFT2ABS, [])
title('maska * |FFT2|')

% Odwrotna transformacja Fouriera
odwrot = ifft2(ifftshift(FFT2_filtered)); % `ifftshift` usuwa przesunięcie widma

% Wyświetlenie przefiltrowanego obrazu
subplot(2,5,10)
imshow(real(odwrot), [])
title('Obraz po filtracji górnoprzepustowej')

%%%%% Zadanie 5  %%%%%%%%%%%%
amplituda = 50;
f = 0.09;
[x,~] = meshgrid(1:512,1:512);

zakluceniePeriodyczne = amplituda *sin(2* pi * f * x);

zakluconyObraz = double(grayImage) + zakluceniePeriodyczne;
figure
imshow(uint8(zakluconyObraz))

