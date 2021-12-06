function [y, h, s, u] = salidaRed(patron, t, w, Beta)
%% Función que calcula la salida de la red (y), los pesos (h, u) y la salida de la capa oculta (s)

% t pesos capa oculta
% w pesos capa salida

% u potencial de la capa oculta

% Hecho para varias salidas.

%% ->> Completar aquí <<-
%% ...

u = patron*t';

s = logistica(u,Beta);

h = w*s'; %columna
% h = s*w'; %fila
y=logistica(h,Beta);            %cálculo de salida de la red, capa de salida


end
