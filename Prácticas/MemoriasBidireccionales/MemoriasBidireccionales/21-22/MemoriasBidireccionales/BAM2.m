clear all; clc;

% Cargamos los datos
load("coche.mat")
load("barco.mat")
load("textoCoche.mat")
load("textoBarco.mat")

% Transformamos las matrices en vectores para poder operar
cocheR = reshape(coche, [], 1);
barcoR = reshape(barco, [], 1);
textoCocheR = reshape(textoCoche, 1, []);
textoBarcoR = reshape(textoBarco, 1, []);

% Hallamos la matriz de pesos
W = cocheR*textoCocheR;
W = W + barcoR*textoBarcoR;

% a) Patrón de barco

PatBarco = reshape(sign(barcoR'*W),size(textoBarco,1),size(textoBarco,2));
% El resultado es el deseado si la comparación es iguala 0
Comparacion = sum(textoBarco-PatBarco,"all");

% b) Matriz de barco corrompida
barcoRoto = imnoise(barco,"gaussian",0,0.5)*2-1;
solTextoBarcoRoto = reshape(barcoRoto,1,[])*W;
% Texto asociado al barco
textoBarcoRoto = reshape(sign(solTextoBarcoRoto),size(textoBarco,1),size(textoBarco,2));

ComparacionBarcoRoto = sum(textoBarco-textoBarcoRoto,"all");

% Vector solución de la imagen del barco
solBarcoRoto = W*solTextoBarcoRoto';

% c)
subplot(3,1,1)
imshow(barcoRoto)
subplot(3,1,2)
imshow(textoBarcoRoto)
subplot(3,1,3)
imshow(reshape(solBarcoRoto,size(barco,1),size(barco,2)))
