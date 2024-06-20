clc


fs= 256;
fc=[5 40];
data = importdata("EEG_#9.txt");
D1=data(:,2:8);
[m,n] = size(D1);
f = (0:m-1)*((fs)/m);
t= data(:,1);

s2=bandstop(D1,[55 65],fs);%filter(Num, 1,D1); %%Aplicando filtro NOTCH
ffts2=abs(fft(s2));


fftx= abs(fft(D1));
fftxreal=fftx;
% filtro Butterworth pasabajas de tercer orden

[B1,A1]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y1=filtfilt(B1,A1,s2(:,1)); %filtfilt
ffty1= abs(fft(y1));


[B2,A2]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y2=filtfilt(B2,A2,s2(:,2)); %filtfilt
ffty2= abs(fft(y2));


[B3,A3]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y3=filtfilt(B3,A3,s2(:,3)); %filtfilt
ffty3= abs(fft(y3));

[B4,A4]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y4=filtfilt(B4,A4,s2(:,4)); %filtfilt
ffty4= abs(fft(y4));


[B5,A5]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y5=filtfilt(B5,A5,s2(:,5)); %filtfilt
ffty5= abs(fft(y5));


[B6,A6]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y6=filtfilt(B6,A6,s2(:,6)); %filtfilt
ffty6= abs(fft(y6));


[B7,A7]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y7=filtfilt(B7,A7,s2(:,7)); %filtfilt
ffty7= abs(fft(y7));
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
figure
nexttile

plot(f,ffts2(:,1)); axis([0 150 0 max(ffts2(:,1))]);
title('T3 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile

plot(f,ffts2(:,2)); axis([0 150 0 max(ffts2(:,2))]);
title('C3 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffts2(:,3)); axis([0 150 0 max(ffts2(:,3))]);
title('C1 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffts2(:,4)); axis([0 150 0 max(ffts2(:,4))]);
title('C4 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffts2(:,5)); axis([0 150 0 max(ffts2(:,5))]);
title('T4 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffts2(:,6)); axis([0 150 0 max(ffts2(:,6))]);
title('O1 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffts2(:,7)); axis([0 150 0 max(ffts2(:,7))]);
title('O2 CON NOTCH')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on


%% Señales con butterworth
figure


nexttile

plot (t,y1)
title('T3 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile

plot (t,y2)
title('C3 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y3)
title('C1 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y4)
title('C4 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y5)
title('T4 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y6)
title('O1 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,y7)
title('O2 con filtro')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on
%%
figure
nexttile

plot(f,ffty1); axis([0 150 0 max(ffty1)]),grid on;
title('T3 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile

plot(f,ffty2); axis([0 150 0 max(ffty2)]),grid on;
title('C3 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty3); axis([0 150 0 max(ffty3)]),grid on;
title('C1 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty4); axis([0 150 0 max(ffty4)]),grid on;
title('C4 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty5); axis([0 150 0 max(ffty5)]),grid on;
title('T4 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty6); axis([0 150 0 max(ffty6)]),grid on;
title('O1 con FFT y filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,ffty7); axis([0 150 0 max(ffty7)]),grid on;
title('O2 con FFT y filtro')
xlabel('frecuencia (Hz)')
ylabel('Magnitud')
