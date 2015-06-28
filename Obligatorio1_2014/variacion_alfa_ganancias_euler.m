####
# Solucion Parte 1.2
####
close all;
clear all;
clc;

# condiciones iniciales del problema
h=0.1; # incremento de tiempo (cada h segundos)
N=20000; # max tiempo (20000 segundos)
gamma = 0.004;
x0=[1/3, 1/3, 1/3];
i=1;

figure
hold on
for alfa = 0:0.2:2
	# solucionamos con Euler
	[x, G, Gt, T] = euler(alfa, gamma, h, x0, N);

	# sacamos el ultimo valor
	T = T(1:end-2);
	Gt = Gt(1:end-2);
	x1 = x(1,1:end-2); #altruistas
	x2 = x(2,1:end-2); #justos
	x3 = x(3,1:end-2); #parasitos
	G1 = G(1,1:end-2);
	G2 = G(2,1:end-2);
	G3 = G(3,1:end-2);

	# mostramos graficos
	plot(T, G1, '-b');
	plot(T, G2, '-r');
	plot(T, G3, '-g');
	legend('Altruistas', 'Justos', 'Parasitos');
	xlabel('Tiempo');
	ylabel('% Pares');
	title('Ganancia Individuales en el sistema segun alfa aplicando Euler');
	i=i+1;
end
print('variacion_individuales_segun_alfa_euler.jpg');
hold off
