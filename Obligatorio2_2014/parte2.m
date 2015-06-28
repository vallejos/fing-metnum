close all
clear all
clc

[I, map]=imread('fing.bmp');
#colormap(gray)
ID=double(I);

[U,S,V]=svd(ID);

Errores = [];
ValoresSingulares = [];
Errores2 = [];
ValoresSingulares2 = [];
Compresion = [];

rI = rank(I);
tamOr = min(prod(size(I)),(sum(size(I))-2)*3*rI);

figure;
buffer = sprintf('Parte 2: Imagen original');
imshow(uint8(ID));
title(buffer);

n = size(diag(S));
D = U*S*V';

error = mse(ID, D);

figure;
buffer = sprintf('Parte 2: Imagen reconstruida a partir de %d valores singulares',n);
imshow(uint8(D));
title(buffer);



for m=0:100  
    n=m+1;
  if ((n == 1) | (mod(n, 10) == 0))  
    C = S;

    C(n+1:end,:)=0;
    C(:,n+1:end)=0;

	D=U*C*V';
	
    figure;
    buffer = sprintf('Con %d valores singulares', n);
    imshow(uint8(D));
	imwrite(uint8(D), strcat('fing_', num2str(n), '_valores_singulares.jpg'));
    title(buffer);

	error = mse(ID, D);

    Errores = [Errores; error];
    ValoresSingulares = [ValoresSingulares; n];

	tamComp = (sum(size(I))-2)*3*n;
	comp = (tamOr-tamComp)*100/tamOr;
	Compresion = [Compresion; comp];
  end
end

figure; 
title('Error en compresion');
plot(ValoresSingulares, Errores);
grid on
xlabel('Cantidad de Valores Singulares usados');
ylabel('Error entre la imagen original y la imagen comprimida');
print('error_en_compresion.jpg');

# parte 4
n=1;
while ((error > 0.0028) && (n < 355))
    C = S;

    C(n+1:end,:)=0;
    C(:,n+1:end)=0;

	D=U*C*V';
	
	error = mse(ID,D);
        Errores2 = [Errores2; error];
        ValoresSingulares2 = [ValoresSingulares2; n];
        
	n=n+1;
end

figure;
buffer = sprintf('MSE <= 0.0028 se logra con %d valores singulares', n-1);
imshow(uint8(D));
title(buffer);

figure;
title('Error en compresion');
plot(ValoresSingulares2, Errores2);
grid on
xlabel('Cantidad de Valores Singulares usados');
ylabel('Error entre la imagen original y la imagen comprimida');