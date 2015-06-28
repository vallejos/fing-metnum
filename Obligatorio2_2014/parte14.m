clear all
close all
clc

% Analizaremos que pasa cuando aumenta el tamaño de la matriz con las funciones
%svd y mysvd primero para matrices cuadradas

Tiempodeej = [];
Tiempodeejmach = [];
Tamaniomatrices = [];

Tiempodeej = [0.071 0.529 1.239];
Tiempodeejmach = [0.011,0.0062862,0.0420001];
Tamaniomatrices = [3 50 100];
 
figure;
grid on
plot(Tiempodeej, Tamaniomatrices);
xlabel('Tiempo de ejecucion svd y mysvd');
ylabel('Tamaño de las matrices cuadradas');
hold on
plot(Tiempodeejmach, Tamaniomatrices,'-r');
legend('Tiempo de ejecucion mysvd','Tiempo de ejecucion svd');
title('Escalabilidad de las funciones con matrices cuadradas');
print('matricescuadradas.jpg');
hold off

%% Para todo de tipo de matrices que cumplen con m mayor o igual a n
Tiempodeej2 = [0.049 0.043 0.067 1.287];
Tiempodeejmach2 = [0.002 0.000999 0.002 0.040999];
Tamaniomatrices2 = [6 9 10 100];

figure;
grid on
plot(Tiempodeej2, Tamaniomatrices2);
xlabel('Tiempo de ejecucion svd y mysvd');
ylabel('Tamaño de las matrices');
hold on
plot(Tiempodeejmach2, Tamaniomatrices2,'-r');
legend('Tiempo de ejecucion mysvd','Tiempo de ejecucion svd');
title('Escalabilidad de las funciones con matrices donde m>=n');
print('matricesmasfilasquecolumnas.jpg');
hold off 