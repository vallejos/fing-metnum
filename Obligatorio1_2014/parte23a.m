##
# Solucion parte 2.3.a
# Resultados Trapecio atendiendo poblaciones limites
##

alfa 	= 2; # condicion inicial alfa
gamma 	= 0.004;
h 		= 0.1; # incremento de tiempo (cada h segundos)
N 		= 60000; # max tiempo (60 segundos)
x0 		= [1/3, 1/3, 1/3];
tol 	= 1/100;

[x, G, Gt, T] = trapecio_euler(alfa, gamma, h, x0, N, tol);

x1 = x(1); #altruistas
x2 = x(2); #justos
x3 = x(3); #parasitos

PobLimite = figure
plot (T, x1, '-r');
hold on;
plot (T, x2, '-b');
hold on;
plot (T, x3, '-g');
hold on;
xlabel('Tiempo');
ylabel('% Pares');
legend('Altruistas', 'Justos', 'Parasitos');
title('Resultados atendiendo Poblaciones Limites');
#print('alfa2.jpg');
