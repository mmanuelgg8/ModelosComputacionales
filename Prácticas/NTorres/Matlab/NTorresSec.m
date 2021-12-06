%% Autor: Manuel González González
clear all;clc;
Ejecuciones = 100;
Tiempo = zeros(1,Ejecuciones);
for e=1:Ejecuciones
    % Empieza contador
    tic

    N=30;
    S = rand(N,N);
    S = round(S); % Matriz de entrada
    sesgo = -2;
    Sprev = zeros(N,N);
    
    % Inicializamios la matriz de pesos
    W = pesos(N);
    
    % Energía y previa
    E = energia(S,N);
    Eprev = -1;
    % Dinámica de la Computación
    while sum(S-Sprev,"all")~=0
        Eprev = E;
        Sprev = S;
%         E
%         S
        for i=1:N
            for j=1:N   
                % Potencial sináptico
                H = sum(W(:,:,i,j).*S,"all");
                
                if H>sesgo
                    S(i,j)=1;
                else
                    S(i,j)=0;
                end
            end
        end
        E = energia(S,N);
    end

%     E
%     S
    % Acaba contador
    Tiempo(1,e) = toc;

end

TiempoMedio = sum(Tiempo)/Ejecuciones;
TiempoMedio

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