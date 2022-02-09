function Vecindad = FuncionVecindad(IndGan,W,Indices)
% Tomamos los tamaños de filas y columnas de la matriz de pesos
[~,x,y] = size(W);

% Generamos la matriz de vecindad inicializada a ceros con el tamaño
% correspondiente
Vecindad = zeros(x,y);
for i=1:x
    for j = 1:y
        % Si es la ganadora actualiza a 1
        if(i==IndGan(1) && j==IndGan(2))
            Vecindad(i,j) = 1;
            % Si es una adyacente acutaliza a 0.15
        elseif(abs(i-IndGan(1)) <= 1 && abs(j-IndGan(2)) <= 1)
            Vecindad(i,j) = 0.15;
            % En cualquier otro caso vale 0
        else 
            Vecindad(i,j) = 0;
        end
    end
end
end