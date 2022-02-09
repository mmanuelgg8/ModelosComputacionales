function [W, eta] = actualizaPesosRefuerzo(W, ganadoras, eta, frame, gt)
%% Resumen
%%Esta función actualiza los pesos en función de las neuronas ganadoras, el
%%peso de cada neurona, el valor de la entrada (frame) y la salida
%%deseada(gt). Además actualiza la tasa de aprendizaje de cada neurona
%%ganadora
%% Entradas
%W: numColor X filasFrame X columnasFrame X NumNeuronasPixel :Matriz de pesos sinápticos
%ganadoras: filasFrame X columnasFrame: Matriz con los índices de las neuronas ganadoras
%eta: filasFrame X columnasFrame X NumNeuronasPixel: Matriz con las tasas de aprendizaje de cada neurona
%frame: numColor X filasFrame X columnasFrame: Matriz con los colores del frame
%gt: filasFrame X columnasFrame: matriz con valor 0 si es fondo ó 1 si es primer plano
%% Salidas
%W: numColor X filasFrame X columnasFrame X NumNeuronasPixel :Matriz de pesos sinápticos
%eta: filasFrame X columnasFrame X NumNeuronasPixel: Matriz con las tasas de aprendizaje de cada neurona
%%

%Bucle que recorre cada pixel del frame
for fil=1:size(W,2)
    for col=1:size(W, 3)
        etaNeurona=eta(fil,col,ganadoras(fil,col));
        
        %Consideraremos la neurona 1 como fondo y la 2 como primer plano
        if (ganadoras(fil,col)==1 && gt(fil,col)==0) || (ganadoras(fil,col)==2 && gt(fil,col)==1)    %Acierto
            %% --> Actualizar pesos sinápticos y etaNeurona <--
            %% --> Código aquí <--
            % Para que sea más legible divido la operación en dos variables sumandos
            PrimerSumando = (1-etaNeurona) * W(:,fil,col,ganadoras(fil,col));
            SegundoSumando = etaNeurona * frame(:,fil,col);
            W(:,fil,col,ganadoras(fil,col)) = PrimerSumando + SegundoSumando;
            % Cuando acierta, la tasa de aprendizaje se reduce para que
            % vaya con paso más pequeño
            etaNeurona = eta(fil,col,ganadoras(fil,col))/(1+eta(fil,col,ganadoras(fil,col)));
        else %Fallo/Error
            %% --> Actualizar etaNeurona <--
            %% --> Para evitar W negativos, no actualices los pesos cuando falle <--
            %% --> Código aquí <--
            % Cuando falla, se reduce la tasa de aprendizaje para que el
            % próximo salto sea mayor
            etaNeurona = eta(fil,col,ganadoras(fil,col))/(1-eta(fil,col,ganadoras(fil,col)));
        end
        %%
        
        if etaNeurona>0.9
                etaNeurona=0.9;
        end    
        eta(fil,col,ganadoras(fil,col))=etaNeurona;
    end
end

end

