clear all
close all
clc
% Load a biological signal
fs=256;
emg=load('EEG_#9.txt'); %señal de EEG con ruido
emg=emg(:,2);
emgl=length(emg);
t=(0:emgl-1)/fs;
subplot(6,1,1)
plot(t,emg)
title('Original signal')
% wavelet decomposition 0-64 Hz
%Calculo de la primera aproximación
[c,l]=wavedec(emg,1,'db2'); %decompose the signal emg in 5 levels using doubechies 2 as mother wavelet
subplot(6,1,2)
plot(c)
title('Wavelet decomposition')
A=appcoef(c,l,'db2',1); % extract approximations
subplot(6,1,3)
plot(A)
% Calculo de detalles desde la aprox. 0-64 al detalle 57-64.

[d,m]= wavedec(A,3,'db2');

[d1,d2, d3]=detcoef(d,m,[1,2, 3]); %extract details
title('Approximation')
subplot(6,1,4)
plot(d1)
title('detail 1')
subplot(6,1,5)
plot(d2)
title('detail 2')
subplot(6,1,6)
plot(d3)
title('detail 3')

%% wavelet reconstruction
figure
subplot(4,1,1)
plot(t,emg)
title('original signal')
a5=wrcoef('a',c,l,'db2',2);
subplot(4,1,2)
plot(t,a5)
title('approximation')
d1=wrcoef('d',c,l,'db2',1);
subplot(4,1,3)
plot(t,d1)
title('detail 1')
d2=wrcoef('d',c,l,'db2',2);
subplot(4,1,4)
plot(t,d2)
title('detail 2')




