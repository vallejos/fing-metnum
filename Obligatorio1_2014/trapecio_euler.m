##
# Implementacion del metodo del Trapecio utilizando Euler como correctivo
##
#alfa = 2; # condicion inicial alfa
#gamma = 0.004;
#h=0.1; # incremento de tiempo (cada h segundos)
#N=60000; # max tiempo (60 segundos)
#x0=[x1 x2 x3]; # condiciones iniciales x1(0) = x2(0) = x3(0) = 1/3
#tol=1/100; # tolerancia para correctivo

function [x, G, Gt, T] = trapecio_euler(alfa, gamma, h, x0, N, tol)
	T=zeros(1,N); # tiempo
	x1=x2=x3=zeros(1,N);
	G1=G2=G3=Gt=zeros(1,N);

	# condiciones iniciales del problema
	x1(1)=x0(1);
	x2(1)=x0(2);
	x3(1)=x0(3);
	T(1) = 1;

	for n=1:N-1
		G1(n) = alfa * (x1(n) + x2(n)) -1;
		G2(n) = (alfa - 1) * (x1(n) / (1 - x2(n)));
		G3(n) = alfa * x1(n);
		Gt(n) = x1(n) * G1(n) + x2(n) * G2(n) + x3(n) * G3(n);
		T(n+1) = T(n) + h;

		[m, ix] = max([G1(n), G2(n), G3(n)]);
		if ix == 1
			# f = G1(n);
			u1(n) = x1(n) + (h/2) * gamma * (G1(n) - Gt(n));
			u2(n) = x2(n) + (h/2) * (-gamma) * x2(n) * (G1(n) - G2(n));
			u3(n) = x3(n) + (h/2) * (-gamma) * x3(n) * (G1(n) - G3(n));

			# predictor
			x1(n+1) = x1(n) + h * gamma * (G1(n) - Gt(n));
			x2(n+1) = x2(n) + h * (-gamma) * x2(n) * (G1(n) - G2(n));
			x3(n+1) = x3(n) + h * (-gamma) * x3(n) * (G1(n) - G3(n));
		elseif ix == 2
			# f = G2(n);
			u1(n) = x1(n) + (h/2) * (-gamma) * x1(n) * (G2(n) - G1(n));
			u2(n) = x2(n) + (h/2) * gamma * (G2(n) - Gt(n));
			u3(n) = x3(n) + (h/2) * (-gamma) * x3(n) * (G2(n) - G3(n));

			# predictor
			x1(n+1) = x1(n) + h * (-gamma) * x1(n) * (G2(n) - G1(n));
			x2(n+1) = x2(n) + h * gamma * (G2(n) - Gt(n));
			x3(n+1) = x3(n) + h * (-gamma) * x3(n) * (G2(n) - G3(n));
		else
			# f = G3(n);
			u1(n) = x1(n) + (h/2) * (-gamma) * x1(n) * (G3(n) - G1(n));
			u2(n) = x2(n) + (h/2) * (-gamma) * x2(n) * (G3(n) - G2(n));
			u3(n) = x3(n) + (h/2) * gamma * (G3(n) - Gt(n));

			# predictor
			x1(n+1) = x1(n) + h * (-gamma) * x1(n) * (G3(n) - G1(n));
			x2(n+1) = x2(n) + h * (-gamma) * x2(n) * (G3(n) - G2(n));
			x3(n+1) = x3(n) + h * gamma * (G3(n) - Gt(n));
		end
		
		aux1=aux2=aux3=0;

		while ((abs(x1(n+1) - aux1)>tol) && (abs(x2(n+1) - aux2)>tol) && (abs(x3(n+1) - aux3)>tol))
			aux1 = x1(n+1);
			aux2 = x2(n+1);
			aux3 = x3(n+1);

			# aplico corrector dependiendo del f (f = max)
			if ix == 1
				# f = G1(k);
				x1(n+1) = u1(n) + (h/2) * gamma * (G1(n) - Gt(n));
				x2(n+1) = u2(n) + (h/2) * (-gamma) * x2(n) * (G1(n) - G2(n));
				x3(n+1) = u3(n) + (h/2) * (-gamma) * x3(n) * (G1(n) - G3(n));
			elseif ix == 2
				# f = G2(k);
				x1(n+1) = u1(n) + (h/2) * (-gamma) * x1(n) * (G2(n) - G1(n));
				x2(n+1) = u2(n) + (h/2) * gamma * (G2(n) - Gt(n));
				x3(n+1) = u3(n) + (h/2) * (-gamma) * x3(n) * (G2(n) - G3(n));
			else
				# f = G3(k);
				x1(n+1) = u1(n) + (h/2) * (-gamma) * x1(n) * (G3(n) - G1(n));
				x2(n+1) = u2(n) + (h/2) * (-gamma) * x2(n) * (G3(n) - G2(n));
				x3(n+1) = u3(n) + (h/2) * gamma * (G3(n) - Gt(n));
			end
		end
		
	end

	# devolvemos la data por fila
	x = [x1; x2; x3];
	G = [G1; G2; G3];
end
