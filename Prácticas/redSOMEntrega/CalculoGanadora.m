function [Gx,Gy]=CalculoGanadora(W,Patron)
% Obtenemos los tamaños de filas y columnas de la matriz de pesos
[~,x,y] = size(W);

% Creamos una variable donde guardar los potenciales sinápticos
H = zeros(x,y);
% Generamos una variable auxiliar con la que comparar el potencial mayor
Hmax = -Inf;
for i = 1:x
    for j = 1:y
        % Calculamos theta
        theta = (W(:,i,j)'*W(:,i,j)) * 1/2;
        % Y hallamos el potencial sináptico 
        H(i,j) = W(:,i,j)' * Patron - theta;
        % Si es mayor que el anterior, cambiamos lo índices de la ganadora
        if(H(i,j)>Hmax)
            Hmax = H(i,j);
            Gx = i;
            Gy = j;
        end
    end
end

end

