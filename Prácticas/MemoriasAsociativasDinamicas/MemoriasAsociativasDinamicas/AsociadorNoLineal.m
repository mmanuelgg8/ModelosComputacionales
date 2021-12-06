S = [-1 -1 1 1 1];
%a) 
A = [-1 -1 1 -1 1];
%b)
B = [1 1 -1 -1 1];

% Calculamos la matriz de pesos.
W = (S'*S)/size(S,2);

% Calculamos el potencial sináptico.
H = S * W;

% Calculamos la salida del patrón principal para ver que se ha memorizado.
Y = ((H>=0)*2)-1;

%Patrón A. Calculamos potencial y salida.
AS = ((A*W>=0)*2)-1;

%Patrón B. Calculamos potencial y salida.
BS = ((B*W>=0)*2)-1;

