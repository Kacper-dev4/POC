function [] = wykresy(t,c,s)

    % Zmiana skali obrazów
    for i = 1:16
    
        resT = imresize(t, 0.5 + (i - 1) * 0.1);
        resC = imresize(c, 0.5 + (i - 1) * 0.1);
        resS = imresize(s, 0.5 + (i - 1) * 0.1);
        
        k1T(i) = wspK(resT);
        k2T(i) = wspMalin(resT);
        k3T(i) = wspMz(resT);

        k1C(i) = wspK(resC);
        k2C(i) = wspMalin(resC);
        k3C(i) = wspMz(resC);

        k1S(i) = wspK(resS);
        k2S(i) = wspMalin(resS);
        k3S(i) = wspMz(resS);
        
    end

figure
subplot(3,3,2)
hold on;
plot(1:16,k1T, '-r^', 'DisplayName', 'triangle'); 
plot(1:16, k1C, '-ko', 'DisplayName', 'circle' );   
plot(1:16, k1S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K1 - Zmiana skali')

subplot(3,3,5)
hold on;
plot(1:16,k2T, '-r^', 'DisplayName', 'triangle'); 
plot(1:16, k2C, '-ko', 'DisplayName', 'circle');   
plot(1:16, k2S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K2 - Zmiana skali')

subplot(3,3,8)
hold on;
plot(1:16,k3T, '-r^', 'DisplayName', 'triangle'); 
plot(1:16, k3C, '-ko', 'DisplayName', 'circle');   
plot(1:16, k3S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K3 - Zmiana skali')

    %Zmiana rotacji

    for i=1:180
        rotT = imrotate(t,i,'bilinear','crop');
        rotC = imrotate(c,i,'bilinear','crop');
        rotS = imrotate(s,i,'bilinear','crop');

        k1T(i) = wspK(rotT);
        k2T(i) = wspMalin(rotT);
        k3T(i) = wspMz(rotT);

        k1C(i) = wspK(rotC);
        k2C(i) = wspMalin(rotC);
        k3C(i) = wspMz(rotC);

        k1S(i) = wspK(rotS);
        k2S(i) = wspMalin(rotS);
        k3S(i) = wspMz(rotS);
    end
subplot(3,3,1)
hold on;
plot(1:180,k1T, '-r^', 'DisplayName', 'triangle'); 
plot(1:180, k1C, '-ko', 'DisplayName', 'circle' );   
plot(1:180, k1S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K1 - Rotacja')

subplot(3,3,4)
hold on;
plot(1:180,k2T, '-r^', 'DisplayName', 'triangle'); 
plot(1:180, k2C, '-ko', 'DisplayName', 'circle');   
plot(1:180, k2S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K2 - Rotacja')

subplot(3,3,7)
hold on;
plot(1:180,k3T, '-r^', 'DisplayName', 'triangle'); 
plot(1:180, k3C, '-ko', 'DisplayName', 'circle');   
plot(1:180, k3S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K3 - Rotacja')

k1T = 0;
k2T = 0;
k3T = 0;
k1C = 0;
k2C = 0;
k3C = 0;
k1S = 0;
k2S = 0;
k3S = 0;
    %translacja
    for i=1:50
    transT = imtranslate(t, [i i]);
    transC = imtranslate(c, [i i]);
    transS = imtranslate(s, [i i]);

    k1T(i) = wspK(transT);
    k2T(i) = wspMalin(transT);
    k3T(i) = wspMz(transT);

    k1C(i) = wspK(transC);
    k2C(i) = wspMalin(transC);
    k3C(i) = wspMz(transC);

    k1S(i) = wspK(transS);
    k2S(i) = wspMalin(transS);
    k3S(i) = wspMz(transS);

    end
subplot(3,3,3)
hold on;
plot(1:50,k1T, '-r^', 'DisplayName', 'triangle'); 
plot(1:50, k1C, '-ko', 'DisplayName', 'circle' );   
plot(1:50, k1S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K1 - Translacja')

subplot(3,3,6)
hold on;
plot(1:50,k2T, '-r^', 'DisplayName', 'triangle'); 
plot(1:50, k2C, '-ko', 'DisplayName', 'circle');   
plot(1:50, k2S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K2 - Translacja')

subplot(3,3,9)
hold on;
plot(1:50,k3T, '-r^', 'DisplayName', 'triangle'); 
plot(1:50, k3C, '-ko', 'DisplayName', 'circle');   
plot(1:50, k3S, '-bs', 'DisplayName', 'square');   
hold off;
legend('triangle','circle','square');
title('K3 - Translacja')
end