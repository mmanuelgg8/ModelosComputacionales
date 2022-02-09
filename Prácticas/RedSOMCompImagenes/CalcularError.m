clear all;
clc;
% Cargamos las imáenes
Lena=imread('Lena.png');
Baboon=imread('Baboon.png');
Peppers=imread('Peppers.png');
% Cargamos las versiones comprimidas
LenaSOFM=imread('LenaSOFM.tif');
BaboonSOFM=imread('BaboonSOFM.tif');
PeppersSOFM=imread('PeppersSOFM.tif');

Lena = double(Lena);
LenaSOFM = double(LenaSOFM);

Baboon = double(Baboon);
BaboonSOFM = double(BaboonSOFM);

Peppers = double(Peppers);
PeppersSOFM = double(PeppersSOFM);

[numFilas,numColum,Rgb]=size(Lena);

% Calculamos los errores cuadráticos medios de cada imagen con su versión
% comprimida
errLena = Lena-LenaSOFM;
ECM(1,1)=sum(errLena(:,:,1).^2,"all")/(numFilas*numColum);
ECM(1,2)=sum(errLena(:,:,2).^2,"all")/(numFilas*numColum);
ECM(1,3)=sum(errLena(:,:,3).^2,"all")/(numFilas*numColum);

errBaboon = Baboon-BaboonSOFM;
ECM(2,1)=sum(errBaboon(:,:,1).^2,"all")/(numFilas*numColum);
ECM(2,2)=sum(errBaboon(:,:,2).^2,"all")/(numFilas*numColum);
ECM(2,3)=sum(errBaboon(:,:,3).^2,"all")/(numFilas*numColum);

errPeppers = Peppers-PeppersSOFM;
ECM(3,1)=sum(errPeppers(:,:,1).^2,"all")/(numFilas*numColum);
ECM(3,2)=sum(errPeppers(:,:,2).^2,"all")/(numFilas*numColum);
ECM(3,3)=sum(errPeppers(:,:,3).^2,"all")/(numFilas*numColum);

% Y hacemos el módulo de los vectores de ECM
modulo = sqrt(sum(ECM.^2,2));
modulo

% La más baja el Lena y la intermedia es Peppers