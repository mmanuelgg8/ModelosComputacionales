function W=IncrementarPesos(W,Patron,Vecindad,eta)
% Tomamos las filas y columnas de la matriz de pesos
[~,x,y] = size(W);
for i=1:x 
    for j = 1:y
        % Para cada elemento actualizamos los pesos
        W(:,i,j) = W(:,i,j) + eta * Vecindad(i,j) * (Patron - W(:,i,j));  
    end
end
end

