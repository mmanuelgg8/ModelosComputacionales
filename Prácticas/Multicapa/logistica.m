function [Y] = logistica(X,beta)
%% Calcula la función logística para cada uno de los elementos del vector columna X
    %% ->> Completar aquí <<-
    
    Y = 1./(1+exp(-2*beta.*X));
    
    % plot([-10:0.1:10],logistica([-10:0.1:10],1),"LineWidth",2);
    % plot([-10:0.1:10],derivadaLogistica([-10:0.1:10],1),"LineWidth",2);
end
