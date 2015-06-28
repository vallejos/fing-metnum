####
# Implementacion Euler hacia adelante
####

# condiciones iniciales del problema
#alfa = 0.1; # condicion inicial alfa
#gamma = 0.004;
#h=0.1; # incremento de tiempo (cada h segundos)
#N=60; # max tiempo (60 segundos)
#x0 = [x01, x02, x03]; # las condiciones iniciales para x1, x2, x3

function [x, G, Gt, T] = euler(alfa, gamma, h, x0, N)

	T=zeros(1,N); # tiempo
	x1=x2=x3=zeros(1,N);
	G1=G2=G3=Gt=zeros(1,N);
	x1(1)=x0(1);
	x2(1)=x0(2);
	x3(1)=x0(3);
	T(1) = 1; #tiempo inicial
	for n=1:N-1
		G1(n) = alfa * (x1(n) + x2(n)) -1;
		G2(n) = (alfa - 1) * (x1(n) / (1 - x2(n)));
		G3(n) = alfa * x1(n);
		Gt(n) = x1(n) * G1(n) + x2(n) * G2(n) + x3(n) * G3(n);
		T(n+1) = T(n) + h;
		
		# obtenemos el maximo para saber que f usar
		[m, ix] = max([G1(n), G2(n), G3(n)]);
		if ix == 1
			# f = G1(n);
			x1(n+1) = x1(n) + h * gamma * (G1(n) - Gt(n));
			x2(n+1) = x2(n) + h * (-gamma) * x2(n) * (G1(n) - G2(n));
			x3(n+1) = x3(n) + h * (-gamma) * x3(n) * (G1(n) - G3(n));
		elseif ix == 2
			# f = G2(n);
			x1(n+1) = x1(n) + h * (-gamma) * x1(n) * (G2(n) - G1(n));
			x2(n+1) = x2(n) + h * gamma * (G2(n) - Gt(n));
			x3(n+1) = x3(n) + h * (-gamma) * x3(n) * (G2(n) - G3(n));
		else
			# f = G3(n);
			x1(n+1) = x1(n) + h * (-gamma) * x1(n) * (G3(n) - G1(n));
			x2(n+1) = x2(n) + h * (-gamma) * x2(n) * (G3(n) - G2(n));
			x3(n+1) = x3(n) + h * gamma * (G3(n) - Gt(n));
		end
	end

	# devolvemos la data por fila
	x = [x1; x2; x3];
	G = [G1; G2; G3];
end
