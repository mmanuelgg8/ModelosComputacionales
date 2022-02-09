function [W, numGanadora] = actualizaPesos(W, ganadoras, eta, frame, numGanadora)
%% Resumen
%%Esta función actualiza los pesos en función de las neuronas ganadoras, el
%%peso de cada neurona, el valor de la entrada (frame) y el número de veces
%%que ha ganado cada neurona ganadora. Además actualiza el número de veces
%%que han ganado las neuronas ganadoras.
%% Entradas
%W: numColor X filasFrame X columnasFrame X NumNeuronasPixel: Matriz de pesos sinápticos
%ganadoras: filasFrame X columnasFrame: Matriz con los índices de las neuronas ganadoras
%eta: double: tasa de aprendizaje de la red
%frame: numColor X filasFrame X columnasFrame: Matriz con los colores del frame
%numGanadora: filasFrame X columnasFrame X NumNeuronasPixel: matriz con el número de veces que ha ganado cada neurona
%% Salidas
%W: numColor X filasFrame X columnasFrame X NumNeuronasPixel :Matriz de pesos sinápticos
%numGanadora: filasFrame X columnasFrame X NumNeuronasPixel: matriz con el número de veces que ha ganado cada neurona
%%

%Bucle que recorre cada pixel del frame
for fil=1:size(W,2)
    for col=1:size(W, 3)
        numVecesGanadora=numGanadora(fil,col,ganadoras(fil,col))+1;
        numGanadora(fil,col,ganadoras(fil,col))=numVecesGanadora;
        
        %% -->Actualizar los pesos sinápticos <--
        %% --> Código aquí <--   
        % Calculamos los nuevos pesos según la fórmula, como queda muy
        % larga, la dividimos en los dos sumandos que la forman
        PrimerSumando = (1-(eta/numGanadora(fil,col,ganadoras(fil,col)))) * W(:,fil,col,ganadoras(fil,col));
        SegundoSumando = (eta/numGanadora(fil,col,ganadoras(fil,col))) * frame(:,fil,col);
        W(:,fil,col,ganadoras(fil,col)) =  PrimerSumando + SegundoSumando ;
    end
end

end

