function Ganadoras = CompeticionSOFM(Model,Muestras)

% Calculamos el número de neuronas del modelo a partir de sus dimensiones
numNeu = Model.NumFilasMapa*Model.NumColsMapa;

% Para cada una de las muestras comprobamos la neurona ganadora y guardamos
% su índice
for i=1:size(Muestras,2)
    muestra = Muestras(:,i);
    DistsCuadrado=sum((repmat(muestra,1,numNeu)-Model.Medias(:,:)).^2,1);
    [Minimo, NdxGana]=min(DistsCuadrado);
    Ganadoras(i)= NdxGana;
end

end