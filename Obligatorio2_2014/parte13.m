close all
clear all
clc
%% Parte 1_3 del obligatorio 2

M1 = [2 5 -6 0 ;1 4 0 0 ;2 7 -1 2;-3 5 -1 2 ;0 -5 8 6 ;-4 3 1 1];

M2 = [2 5 -6 0 3 1;1 4 0 0 1 5;2 7 -1 2 1 0;-3 5 -1 2 0 4;0 -5 8 6 2 1;-4 3 1 1 9 0;3 4 6 0 1 -3;1 -6 0 7 3 2;3 -2 5 0 1 8];

M3 = abs(randn(100))*5+10;

M4 = [2 5 -6 0 3 1 3 2 5;1 4 0 0 1 5 1 6 9;2 7 -1 2 1 0 2 3 4;-3 5 -1 2 0 4 9 0 2;0 -5 8 6 2 1 1 3 4;-4 3 1 1 9 0 -8 4 0;3 4 6 0 1 -3 0 1 3;1 -6 0 7 3 2 4 3 2;3 -2 5 0 1 8 2 0 1;1 -6 0 8 3 -2 -1 3 0];

M5 = abs(randn(50));

# M1
tic
[S1, V1, D1] = mysvd(M1);
toc
MR = S1*V1*D1';
Precision1 = mse(M1,MR)

tic
[s1, v1, d1] = svd(M1);
toc
mr= s1*v1*d1';
Precision1maq =mse(M1,mr)

# M2
tic
[S2, V2, D2] = mysvd(M2);
toc
MR = S2*V2*D2';
Precision2 = mse(M2,MR)

tic
[s2, v2, d2] = svd(M2);
toc
mr= s2*v2*d2';
Precision2maq =mse(M2,mr)

# M3
tic
[S3, V3, D3] = mysvd(M3);
toc
MR = S3*V3*D3';
Precision3 = mse(M3,MR)

tic
[s3, v3, d3] = svd(M3);
toc
mr= s3*v3*d3';
Precision3maq =mse(M3,mr)

#M4
tic
[S4, V4, D4] = mysvd(M4);
toc
MR = S4*V4*D4';
Precision4 = mse(M4,MR)

tic
[s4, v4, d4] = svd(M4);
toc
mr= s4*v4*d4';
Precision4maq =mse(M4,mr)

#M5
tic
[S5, V5, D5] = mysvd(M5);
toc
MR = S5*V5*D5';
Precision5 = mse(M5,MR)

tic
[s5, v5, d5] = svd(M5);
toc
mr= s5*v5*d5';
Precision5maq =mse(M5,mr)

%% Graficamos los resultados

VecPresicion = [Precision1,Precision2,Precision4,Precision5,Precision3];
VecPresicionmaq = [Precision1maq,Precision2maq,Precision4maq,Precision5maq,Precision3maq];
Vectamanio = [6,9,10,50,100];

plot(Vectamanio,VecPresicion,'-r');
hold on
plot (Vectamanio,VecPresicionmaq,'-g');
title('Precision de los metodos svd y mysvd');
xlabel('Tamano de las matrices');
ylabel('Error cometido por las funciones');
legend('Error mysvd','Error svd');
print('precision_svd_y_mysvd.jpg');
