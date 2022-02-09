function [ganadorasIndices] = calculaGanadoras(frame, W)
%% Resumen: 
%%Esta función toma un frame y una matriz de pesos. Devuelve una matriz
%%de enteros del tamaño del frame, donde cada elemento será el índice de la
%%neurona ganadora en esa posición (píxel) del frame
%%Opcional: Se pueden usar más de dos neuronas por píxel (más tiempo de cómputo).
%% Entradas
%frame: numColor X filasFrame X columnasFrame: Matriz con los colores del frame
%W: numColor X filasFrame X columnasFrame X NumNeuronasPixel :Matriz de pesos sinápticos
%% Salida: 
% ganadorasIndices: filasFrame X columnasFrame: Matriz con los índices de las neuronas ganadoras
%%


%Hs: filasFrame X columnasFrame X NumNeuronasPixel: Matriz que almacena el potencial sináptico de cada neurona
%Neurona 1 modela fondo. Neurona 2 modela primer plano.
Hs=zeros(size(frame,2), size(frame, 3), size(W,4));
 for idx=1:size(W,4)
     %% -->>IMPLEMENTAR CÁLCULO DE LA MATRIZ DE POTENCIALES SINÁPTICOS<<--
     %% --> Código aquí <--
     % Hacemos los sumandos del potencial sináptico
     sumas = W(1,:,:,idx).*frame(1,:,:) + W(2,:,:,idx).*frame(2,:,:) + W(3,:,:,idx).*frame(3,:,:);
     % Y calculamos el sesgo
     cuadrados = sum(W(:,:,:,idx).*W(:,:,:,idx),1)/2;
     % Con la resta de ambos obtenemos el potencial sináptico
     Hs(:,:,idx) = sumas - cuadrados;

 end

 %% Recorrido por las matrices de potenciales para encontrar la neurona con
 %%mayor potencial de cada pixel, hacemos un recorrido por cada una de las
 %%matrices de pesos
 mejoresPotenciales=Hs(:,:,1);                                      %Tomamos como mejor potencial inicial los de las neuronas con índice 1
 ganadorasIndices=ones(size(frame,2), size(frame, 3));              %Asignamos el índice del mejor potencial, por ahora el 1
 for idx=2:size(W,4)    %Recorremos el resto de índices de neuronas
    ganadorasParcial=Hs(:,:,idx)>mejoresPotenciales;                %Apuntamos los elementos que mejoran el mejor potencial actual (los ponemos a 1)
    mejoresPotenciales=mejoresPotenciales .* ~(ganadorasParcial);   %Dejamos a 0 donde estaban las ganadoras "derrotadas" para en la línea siguiente sustituir su valor
    mejoresPotenciales=mejoresPotenciales + (ganadorasParcial .* Hs(:,:,idx)); %Sustituimos potenciales "derrotados" (estaban a 0) por los potenciales ganadores actuales
    
    ganadorasIndices=ganadorasIndices .* ~(ganadorasParcial);       %Dejamos a 0 donde estaban los índices ganadores "derrotados"
    ganadorasIndices=ganadorasIndices+ganadorasParcial*idx;         %Sustituimos los índices "derrotados" (0) por los índices ganadores
 end
 
 ganadorasIndices=uint8(ganadorasIndices);
