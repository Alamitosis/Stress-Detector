clear all
close all
clc

fs = 256;
emg = load('EEG_#9.txt'); % Señal de EEG con ruido
emg = emg(:, 2);
emgl = length(emg);
t = (0:emgl-1) / fs;

% Realizar la transformada wavelet continua
wname = 'db2'; % Nombre de la wavelet a utilizar
scales = 1:128; % Escalas de análisis
coefs = cwt(emg, scales, wname);

% Encontrar la escala correspondiente a 60 Hz
freq = 60; % Frecuencia del ruido a eliminar
scale_60Hz = fs / (freq * 2 * pi);

% Encontrar el índice de la escala más cercana a la frecuencia de 60 Hz
[~, index] = min(abs(scales - scale_60Hz));

% Asegurarse de que el índice no esté fuera de los límites
if index < 3
    index = 3;
elseif index > length(scales) - 2
    index = length(scales) - 2;
end

% Eliminar el ruido de 60 Hz estableciendo los coeficientes a cero
coefs(index-2:index+2, :) = 0;

% Reconstruir la señal filtrada utilizando la inversa de la transformada wavelet
emg_filtrada = icwt(coefs, scales, num2str(wname)); % Convertimos 'db2' a cadena de caracteres

% Graficar la señal original y la señal filtrada
subplot(5,1,2)
plot(t, emg_filtrada)
title('Signal with 60Hz noise removed')