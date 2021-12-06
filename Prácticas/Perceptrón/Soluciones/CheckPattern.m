function res = CheckPattern(Data,W)

% Obtengo los datos y pongo la columna de resultados inicializada a -1
    Input = [Data(:,1:end-1) zeros(size(Data,1),1)-1];
% Cojo el conjunto salida de los datos
    B = Data(:,end);
% Compruebo si el resultado de la entrada con la matriz de pesos es igual a
% la salida esperada
    res = isequal(Signo(Input*W),B);
end