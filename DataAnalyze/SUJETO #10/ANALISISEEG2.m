clc


fs= 256;
fc=[5 40];
data = importdata("EEG_#10.txt");
D1=data(:,2:8);
[m,n] = size(D1);
f = (0:m-1)*((fs)/m);
t= data(:,1);

% Aplicación de filtro NOTCH
s2=bandstop(D1,[55 65],fs);%filter(Num, 1,D1); %%Aplicando filtro NOTCH
ffts2=abs(fft(s2));


fftx= abs(fft(D1));
fftxreal=fftx;

% filtro Butterworth pasabajas de tercer orden

[B1,A1]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y1=filtfilt(B1,A1,s2); %filtfilt
ffty1= abs(fft(y1));




%PSD with window and overlap

segmentLength = 132;
noverlap = 25;
            
pxx = pwelch(y1,segmentLength,noverlap);



%% Señales normales
figure
nexttile

plot (t,D1(:,1))
title('T3')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile

plot (t,D1(:,2))
title('C3')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,D1(:,3))
title('C1')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,D1(:,4))
title('C4')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,D1(:,5))
title('T4')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,D1(:,6))
title('O1')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,D1(:,7))
title('O2')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on
%% FFT de las señales normales
figure
nexttile

plot(f,fftxreal(:,1)); axis([0 150 0 max(fftxreal(:,1))]),grid on;
title('T3 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile

plot(f,fftxreal(:,2)); axis([0 150 0 max(fftxreal(:,2))]),grid on;
title('C3 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,fftxreal(:,3)); axis([0 150 0 max(fftxreal(:,3))]),grid on;
title('C1 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,fftxreal(:,4)); axis([0 150 0 max(fftxreal(:,4))]),grid on;
title('C4 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,fftxreal(:,5)); axis([0 150 0 max(fftxreal(:,5))]),grid on;
title('T4 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,fftxreal(:,6)); axis([0 150 0 max(fftxreal(:,6))]),grid on;
title('O1 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,fftxreal(:,7)); axis([0 150 0 max(fftxreal(:,7))]),grid on;
title('O2 con FFT')
xlabel('frecuencia (Hz)')
ylabel('Magnitud')
%%
% FFT de Señales con filtro notch
%figure
%nexttile

%plot(f,ffts2(:,1)); axis([0 150 0 max(ffts2(:,1))]);
%title('T3 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile

%plot(f,ffts2(:,2)); axis([0 150 0 max(ffts2(:,2))]);
%title('C3 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile
%plot (data.Tiempo,data.E1);
%plot(f,ffts2(:,3)); axis([0 150 0 max(ffts2(:,3))]);
%title('C1 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile
%plot (data.Tiempo,data.E1);
%plot(f,ffts2(:,4)); axis([0 150 0 max(ffts2(:,4))]);
%title('C4 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile
%plot (data.Tiempo,data.E1);
%plot(f,ffts2(:,5)); axis([0 150 0 max(ffts2(:,5))]);
%title('T4 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile
%plot (data.Tiempo,data.E1);
%plot(f,ffts2(:,6)); axis([0 150 0 max(ffts2(:,6))]);
%title('O1 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on

%nexttile
%plot (data.Tiempo,data.E1);
%plot(f,ffts2(:,7)); axis([0 150 0 max(ffts2(:,7))]);
%title('O2 CON NOTCH')
%xlabel('Frecuencia (Hz)')
%ylabel('Magnitud')
%grid on


%% Señales con butterworth
figure


nexttile

plot (t,y1(:,1))
title('T3 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile

plot (t,y1(:,2))
title('C3 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y1(:,3))
title('C1 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y1(:,4))
title('C4 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y1(:,5))
title('T4 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y1(:,6))
title('O1 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y1(:,7))
title('O2 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on
%%
figure
nexttile

plot(f,ffty1(:,1)); axis([0 150 0 max(ffty1(:,1))]),grid on;
title('T3 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile

plot(f,ffty1(:,2)); axis([0 150 0 max(ffty1(:,2))]),grid on;
title('C3 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty1(:,3)); axis([0 150 0 max(ffty1(:,3))]),grid on;
title('C1 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty1(:,4)); axis([0 150 0 max(ffty1(:,4))]),grid on;
title('C4 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty1(:,5)); axis([0 150 0 max(ffty1(:,5))]),grid on;
title('T4 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty1(:,6)); axis([0 150 0 max(ffty1(:,6))]),grid on;
title('O1 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty1(:,7)); axis([0 150 0 max(ffty1(:,7))]),grid on;
title('O2 con FFT y filtro')
xlabel('frecuencia (Hz)')
ylabel('Magnitud')

%%
%Graficación de PSD with window and overlap

figure
pltpxx= 10*log10(pxx)
plot(pltpxx), grid on
title('PSD Welch with window and overlap','FontSize',9);
xlabel('Frequency (Hz)','FontSize',7); ylabel('Power (dB)','FontSize',7)