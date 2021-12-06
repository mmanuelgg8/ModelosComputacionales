clear all; clc;
% Patrón A (imagen y su asociado)
A = [1 1 1; -1 1 -1; -1 1 -1];
As = [1 -1 -1];
imagesc(A);
% Patrón B 
B = [1 -1 -1; 1 -1 -1; 1 1 1];
Bs = [-1 -1 1];
imagesc(B);

% Patrón a probar
Pat = [-1 -1 -1; 1 -1 -1; 1 1 -1];

% Reordenamos para poder operar
Ar = reshape(A,[],1);
Br = reshape(B,[],1);
Patr = reshape(Pat,[],1);
% Calculamos la matriz de pesos
W=Ar*As;
W=W+Br*Bs;

% Comprobamos si detecta los patrones originales
% Hallamos el potencial de ambos patrones
AP = W*As';
BP = W*Bs';

% Hallamos la salida
SA = sign(AP);
SB = sign(BP);

% Reordenamos el vector
SolA = reshape(SA,3,3);
SolB = reshape(SB,3,3);

% E imprimimos el resultado
imagesc(SolA)
imagesc(SolB)

% Y si queremos hallar el patrón asociado a la imagen

PatA = sign(SA'*W);
PatB = sign(SB'*W);

% Ahora comprobamos qué sale con el patrón del ejercicio
PatS = sign(Patr'*W);
% Y comprobamos que reconoce la salida del patrón B