clear;
clc;
close all;

load DatosAND
load DatosLS5
load DatosLS10
%load DatosLS50
%load DatosOR
%load DatosXOR

Data(:,end)=Data(:,end)==1;

LR=0.5;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

W=PerceptronWeigthsGenerator(Data);

Epoc=1;
BestEpoc = 1;
Ones=ones(1,length(Data));
% Bolsillo
Wpocket = W;
while (Ones*abs(CheckPattern(Data,W)) ~= 0) && Epoc<MaxEpoc
% Si el número de aciertos de los pesos actuales es mayor que el del
% bolsillo, se actualiza.
     if (Ones*abs(CheckPattern(Data,W))) < (Ones*abs(CheckPattern(Data,Wpocket)))
         Wpocket = W;
         BestEpoc = Epoc;
         disp('Weight changed'); disp(Wpocket);
         disp('BestEpoc '); disp(BestEpoc);
     end
     for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites);
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
        
        if Output~=Target
           W=UpdateNet(W,LR,Output,Target,Input);
        end
        
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites)
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
     
    end
    Epoc=Epoc+1;
end

% Si ha acabado correctamente, dibuja esa última solución.
% Si no, devuelve la mejor solución guardada en el bolsillo.
if (Ones*abs(CheckPattern(Data,W)) == 0)
        disp('W Output ');
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites)
        GrapNeuron(W,Limites);hold off;
        drawnow
else 
        disp('Wpocket Output '); disp(Wpocket);
        disp(Ones*abs(CheckPattern(Data,Wpocket)));
        disp(BestEpoc);
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites)
        GrapNeuron(Wpocket,Limites);hold off;
        drawnow
end
