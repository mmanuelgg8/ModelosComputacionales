function [nuevoW] = UpdateNet(W,LR,Output,Target,Input)

% Diferencia entre el valor esperado y la salida obtenida
Increment = Target - Output;
% Valor de aprendizaje para actualización
Learned = LR * (Input * transpose(Increment));
% Nueva matriz de pesos aprendida
nuevoW = W + transpose(Learned);

end
