%clear;
%clc;
close all;

load DatosAND
%load DatosLS5
load DatosLS10
%load DatosLS50
%load DatosOR
load DatosXOR

LR=0.5;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

%W=PerceptronWeigthsGenerator(Data);
W=[0,0,0]';

Epoc=1;
ECM = [];
while ~CheckPattern(Data,W) && Epoc<MaxEpoc
     for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
        % Calculamos el ECM
        ECM(Epoc) = (Target-Output)^2/(2*size(Data,1));

%         GrapDatos(Data,Limites);
%         GrapPatron(Input,Output,Limites);
%         GrapNeuron(W,Limites);hold off;
%         drawnow
%         pause;
        
        if Signo(Output)~=Target
           W=UpdateNet(W,LR,Output,Target,Input);
        end
        
%         GrapDatos(Data,Limites);
%         GrapPatron(Input,Output,Limites)
%         GrapNeuron(W,Limites);hold off;
%         drawnow
%         pause;
     
    end
    Epoc=Epoc+1;
end

plot(ECM);
