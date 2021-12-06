function [nuevoW] = UpdateNet(W,LR,Output,Target,Input)
%UPDATENET Summary of this function goes here
%   Detailed explanation goes here
%difW=LR*(Target-Output).*[Input -1];

%nuevoW=W+difW';

% Diferencia entre el valor esperado y la salida obtenida
Increment = Target - Output;
% Valor de aprendizaje para actualización
Learned = LR * (Input * transpose(Increment));
% Nueva matriz de pesos aprendida
nuevoW = W + transpose(Learned);

end
