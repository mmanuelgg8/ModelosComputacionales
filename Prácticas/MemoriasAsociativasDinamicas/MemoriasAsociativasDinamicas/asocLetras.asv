clear all;clc;
d(:,:,1)=[1 1 -1 -1 -1 1 1;1 1 -1 1 -1 1 1;1 1 -1 1 -1 1 1;1 1 -1 1 -1 1 1;1 -1 -1 -1 -1 -1 1;1 -1 1 1 1 -1 1;1 -1 1 1 1 -1 1;1 -1 1 1 1 -1 1;-1 -1 1 1 1 -1 -1;];
d(:,:,2)=[1 -1 -1 -1 -1 -1 1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 -1 -1 -1 -1 1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 -1 -1 -1 -1 1;];
d(:,:,3)=[1 -1 -1 -1 -1 -1 -1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;1 -1 -1 -1 -1 -1 -1;];
d(:,:,4)=[1 -1 -1 -1 -1 -1 1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 1 1 1 1 -1;1 -1 -1 -1 -1 -1 1;];
d(:,:,5)=[-1 -1 -1 -1 -1 -1 -1; -1 1 1 1 1 1 1; -1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 -1 -1 -1 -1 -1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 1 1 1 1 1 1;-1 -1 -1 -1 -1 -1 -1;];

%A = reshape(A,[],1);

% Transormamos los datos en vectores para poder operar
for i = 1:size(d,3)
    t(:,i)=reshape(d(:,:,i),[],1);
end

m=size(t,2); %número de patrones
n=size(t,1);

% Calculamos los pesos
W=zeros(n,n);
for i=1:m
    W=W+t(:,i)*t(:,i)';
end

% Eliminamoms autoasociaciones
%for i=1:n
%    W(i,i)=0; % Elementos diagonales iguales a cero
%end

% Comprobamos las soluciones e imprimimos el resultado 
sol = 1;
% Obtenemos el vector solución resultante
vectorSol = sign(W*reshape(d(:,:,sol),[],1));
% Lo transformamos en la matriz esperada para representarla
matrixSol = reshape(vectorSol,9,7);
imshow(matrixSol)


%d)
%Introducimos las letras A y B.
td(:,1)=reshape(d(:,:,1),[],1);
td(:,2)=reshape(d(:,:,2),[],1);

%Calculamos los pesos
Wd=zeros(n,n);
for i=1:2
    Wd=Wd+td(:,i)*td(:,i)';
end

%Calculamos la salida para A y B
solA = 1;
solB = 2;
% Obtenemos el vector solución resultante
vectorSolA = sign(Wd*reshape(d(:,:,solA),[],1));
vectorSolB = sign(Wd*reshape(d(:,:,solB),[],1));

% Lo transformamos en la matriz esperada para representarla
matrixSolA = reshape(vectorSolA,9,7);
matrixSolB = reshape(vectorSolB,9,7);

%imshow(matrixSolA)
%imshow(matrixSolB)
