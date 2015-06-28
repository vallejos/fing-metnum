function [S, V, D] = mysvd(A)
TAM = columns(A)
TAMT = rows(A)
ITER = 100;

if TAMT < TAM
	A2 = A';
        %filas = rows(A2);
        %columnas = columns(A2);
        [UU,B,VV]= bidiag(A2, 'imag');  # n x m
        Uk = eye(TAMT);
        Vk = eye(TAM);
        aux = B';
        for k=2:(ITER + 1)
	 [Qk,Rk] = qr(aux);

	 # si k es par
	 if mod(k, 2) == 0
                Uk = Uk * Qk;
		
	 else
		# si k es impar
		Vk = Vk * Qk;
	 end
	
	  aux = Rk';
         end
S = VV*Uk;
V = Rk';
D = UU*Vk;

[M N]= size(V);
Diagonal =diag(V);
V=zeros(M,N);
for n=1:length(Diagonal)
  SSN=Diagonal(n);
  V(n,n)=abs(SSN);
  if (SSN < 0)
   S(:,n)=-S(:,n);
  end

end

        
        
else
 [UU,B,VV]= bidiag(A, 'imag'); # m x n
 filas = rows(A);
 columnas = columns(A);
 aux = B';
 Uk = eye(filas);
 Vk = eye(columnas);

 for k=1:ITER
	[Qk,Rk] = qr(aux);

	# si k es par
	if mod(k, 2) == 0
                Uk = Uk * Qk;
		
	else
		# si k es impar
		Vk = Vk * Qk;
	end
	
	aux = Rk';
 end
 
S = UU*Uk;
V = Rk;
D = VV*Vk;

[M N]= size(V);
Diagonal =diag(V);
V=zeros(M,N);
for n=1:length(Diagonal)
  SSN=Diagonal(n);
  V(n,n)=abs(SSN);
  if (SSN < 0)
   S(:,n)=-S(:,n);
  end

end
end