%% Autor: Manuel González González
clear all;clc;
N=3;
S = [0 1 1; 1 1 0; 0 1 0]; % Matriz de entrada ejercicio 2
sesgo = -2;
Sprev = zeros(N,N);
X = zeros(N,N); % Matriz auxiliar

% Inicializamios la matriz de pesos
W = pesos(N);

%% Ejercicio 3 c)
% Wc = pesos(2);
% try chol(Wc)
%     disp('Matrix is symmetric positive definite.')
% catch ME
%     disp('Matrix is not symmetric positive definite')
% end


% Energía, previa y diferencial
E = energia(S,N);
Eprev = -1;
difE = E-Eprev;
% Dinámica de la Computación
while sum(S-Sprev,"all")~=0
    Sprev = S;
    Eprev = E;
    Eprev
    S = actualiza(S,W,N,sesgo);
    S
    E = energia(S,N);
    E
end

E
S

function W = pesos(N)
    W = zeros (N,N,N,N); % Matrices de pesos (filaPeso,columnaPeso,FilaIndiceNeurona,columnaIndiceNeurona)
    for i = 1:N
        for j = 1:N
            for k = 1:N
                if k ~= j
                    W(i,j,i,k)=-2;
                end
                if k ~= i
                    W(i,j,k,j)=-2;
                end
            end
        end
    end
end

function E = energia(S,N)
    termino1=0;
    termino2=0;
    for i=1:N
        for j=1:N
            termino1=termino1+S(i,j);
        end
        termino1=(termino1-1)^2;
    end
    for j=1:N
        for i=1:N
            termino2=termino2+S(i,j);
        end
        termino2=(termino2-1)^2;
    end
    E = termino1 + termino2;
end

function X = actualiza(S,W,N,sesgo)
    for i=1:N
        for j=1:N
            % Potencial sináptico
            H = sum(W(:,:,i,j).*S,"all");
            
            if H>=sesgo
                X(i,j)=1;
            else
                X(i,j)=0;
            end
        end
    end
end