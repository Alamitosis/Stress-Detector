clc

fs= 256;
fc=45;
letterds = datastore("P2.xlsx");
data = read(letterds);

% filtro Butterworth pasabajas de tercer orden
xT3= data.T3;
t= data.Tiempo;
fftxT3= abs(fft(xT3));
[B1,A1]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y1=filtfilt(B1,A1,xT3); %filtfilt
ffty1= abs(fft(y1));

xC3= data.C3;
fftxC3= abs(fft(xC3));
[B2,A2]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y2=filtfilt(B2,A2,xC3); %filtfilt
ffty2= abs(fft(y2));

xC1= data.C1;
fftxC1= abs(fft(xC1));
[B3,A3]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y3=filtfilt(B3,A3,xC1); %filtfilt
ffty3= abs(fft(y3));

xC4= data.C4;
fftxC4= abs(fft(xC4));
[B4,A4]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y4=filtfilt(B4,A4,xC4); %filtfilt
ffty4= abs(fft(y4));

xT4= data.T4;
fftxT4= abs(fft(xT4));
[B5,A5]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y5=filtfilt(B5,A5,xT4); %filtfilt
ffty5= abs(fft(y5));

xO1= data.O1;
fftxO1= abs(fft(xO1));
[B6,A6]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y6=filtfilt(B6,A6,xO1); %filtfilt
ffty6= abs(fft(y6));

xO2= data.O2;
fftxO2= abs(fft(xO2));
[B7,A7]=butter(3,fc/(fs/2)); %fc=frecuencia de corte
y7=filtfilt(B7,A7,xO2); %filtfilt
ffty7= abs(fft(y7));


nexttile

plot (t,xT3)
title('T3')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile

plot (t,xC3)
title('C3')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,xC1)
title('C1')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,xC4)
title('C4')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,xT4)
title('T4')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,xO1)
title('O1')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,xO2)
title('O2')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

figure
nexttile

plot (t,fftxT3)
title('T3 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile

plot (t,fftxC3)
title('C3 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,fftxC1)
title('C1 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,fftxC4)
title('C4 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,fftxT4)
title('T4 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,fftxO1)
title('O1 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot (t,fftxO2)
title('O2 con FFT')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
grid on
