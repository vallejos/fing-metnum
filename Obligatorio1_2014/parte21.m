####
# Solucion Parte 1.2
####
close all;
clear all;
clc;

# condiciones iniciales del problema
h=0.1; # incremento de tiempo (cada h segundos)
N=20000; # max tiempo (60 segundos)
alfa = 0.1; # condicion inicial alfa
gamma = 0.004;
x0=[1/3, 1/3, 1/3];

# solucionamos con euler
[x, G, Gt, T] = euler(alfa, gamma, h, x0, N);

x1 = x(1,:); #altruistas
x2 = x(2,:); #justos
x3 = x(3,:); #parasitos

G1 = G(1,:);
G2 = G(2,:);
G3 = G(3,:);

# mostramos graficos

plot (T, x1, '-r');
hold on;
plot (T, x2, '-b');
hold on;
plot (T, x3, '-g');
hold on;
xlabel('Tiempo');
ylabel('% Pares');
legend('Altruistas', 'Justos', 'Parasitos');
title('Resultados con Poblaciones Limites aplicando Euler');
#print('alfa2.jpg');
