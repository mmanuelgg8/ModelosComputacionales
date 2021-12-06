function [Input,Output,Target]=ValoresIOT(Data,W,i)
% Obtenemos los datos de entrada i
Input = [Data(i,1:end-1) 1];
% Obtenemos la salida esperada
Target = Data(i,end);
% Calculamos la salida de esta entrada con la matriz de pesos
Output = 0+(Input * W>=0);
end