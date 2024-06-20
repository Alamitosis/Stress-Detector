clc
%% Cargar señal
fs= 256;
data = importdata("EEG_#2.txt");
D1=data(:,2:8);
[m,n] = size(D1);
f = (0:m-1)*((fs)/m);
t= data(:,1);
% Obtener FFT
fftD1=fft(D1);
fftD1Magn= abs(fft(D1));
fftD1Imag= imag(fft(D1));
fftD1angle= angle(fft(D1));
lefft=length(fftD1);

figure
stem(fftD1Magn(:,1))
title('T3 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,2))
title('C3 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,3))
title('C1 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,4))
title('C4 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,5))
title('T4 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,6))
title('O1 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')
figure
stem(fftD1Magn(:,7))
title('O2 con FFT discretizada')
xlabel('# de muestra')
ylabel('Magnitud')

%% Cortar vector FFT
le= length(fftD1)/2;
fftNV= fftD1(1:le,:);
%length(fftD1)
%length(fftNV)

%% Obtener vector de magnitud
fftNVMagn= fftD1Magn(1:le,:);
%% Obtener vector de fase
fftNVImag= fftD1Imag(1:le,:);
fftNVangle= fftD1angle(1:le,:);
%% Obtener vector de frecuencias
fnew= f(:,1:le);
fnewM=f(:,1:lefft);

%% Obtener los 3 puntos máximos de magnitudes

T3NV(:,1)=fftNVMagn(:,1); % Matriz que involucra magnitud, fase y frecuencia
T3NV(:,2)=fftNVangle(:,1);
T3NV(:,3)=fnew;

C3NV(:,1)=fftNVMagn(:,2);
C3NV(:,2)=fftNVangle(:,2);
C3NV(:,3)=fnew;

C1NV(:,1)=fftNVMagn(:,3);
C1NV(:,2)=fftNVangle(:,3);
C1NV(:,3)=fnew;

C4NV(:,1)=fftNVMagn(:,4);
C4NV(:,2)=fftNVangle(:,4);
C4NV(:,3)=fnew;

T4NV(:,1)=fftNVMagn(:,5);
T4NV(:,2)=fftNVangle(:,5);
T4NV(:,3)=fnew;

O1NV(:,1)=fftNVMagn(:,6);
O1NV(:,2)=fftNVangle(:,6);
O1NV(:,3)=fnew;

O2NV(:,1)=fftNVMagn(:,7);
O2NV(:,2)=fftNVangle(:,7);
O2NV(:,3)=fnew;


maxT3NV= maxk(T3NV(:,1),20);
maxC3NV= maxk(C3NV(:,1),20);
maxC1NV= maxk(C1NV(:,1),20);
maxC4NV= maxk(C4NV(:,1),20);
maxT4NV= maxk(T4NV(:,1),20);
maxO1NV= maxk(O1NV(:,1),20);
maxO2NV= maxk(O2NV(:,1),20);

%Busca la posición en que se encuentran los valores más altos en magnitud
filasMAXNV(1:20,1) = find(T3NV(:, 1) == maxT3NV(1) | ...
                        T3NV(:, 1) == maxT3NV(2) | ...
                        T3NV(:, 1) == maxT3NV(3) | ...
                        T3NV(:, 1) == maxT3NV(4) | ...
                        T3NV(:, 1) == maxT3NV(5) | ...
                        T3NV(:, 1) == maxT3NV(6) | ...
                        T3NV(:, 1) == maxT3NV(7) | ...
                        T3NV(:, 1) == maxT3NV(8) | ...
                        T3NV(:, 1) == maxT3NV(9) | ...
                        T3NV(:, 1) == maxT3NV(10) | ...
                        T3NV(:, 1) == maxT3NV(11) | ...
                        T3NV(:, 1) == maxT3NV(12) | ...
                        T3NV(:, 1) == maxT3NV(13) | ...
                        T3NV(:, 1) == maxT3NV(14) | ...
                        T3NV(:, 1) == maxT3NV(15) | ...
                        T3NV(:, 1) == maxT3NV(16) | ...
                        T3NV(:, 1) == maxT3NV(17) | ...
                        T3NV(:, 1) == maxT3NV(18) | ...
                        T3NV(:, 1) == maxT3NV(19) | ...
                        T3NV(:, 1) == maxT3NV(20));

filasMAXNV(1:20,2) = find(C3NV(:, 1) == maxC3NV(1) | ...
                        C3NV(:, 1) == maxC3NV(2) | ...
                        C3NV(:, 1) == maxC3NV(3) | ...
                        C3NV(:, 1) == maxC3NV(4) | ...
                        C3NV(:, 1) == maxC3NV(5) | ...
                        C3NV(:, 1) == maxC3NV(6) | ...
                        C3NV(:, 1) == maxC3NV(7) | ...
                        C3NV(:, 1) == maxC3NV(8) | ...
                        C3NV(:, 1) == maxC3NV(9) | ...
                        C3NV(:, 1) == maxC3NV(10) | ...
                        C3NV(:, 1) == maxC3NV(11) | ...
                        C3NV(:, 1) == maxC3NV(12) | ...
                        C3NV(:, 1) == maxC3NV(13) | ...
                        C3NV(:, 1) == maxC3NV(14) | ...
                        C3NV(:, 1) == maxC3NV(15) | ...
                        C3NV(:, 1) == maxC3NV(16) | ...
                        C3NV(:, 1) == maxC3NV(17) | ...
                        C3NV(:, 1) == maxC3NV(18) | ...
                        C3NV(:, 1) == maxC3NV(19) | ...
                        C3NV(:, 1) == maxC3NV(20));

filasMAXNV(1:20,3) = find(C1NV(:, 1) == maxC1NV(1) | ...
                        C1NV(:, 1) == maxC1NV(2) | ...
                        C1NV(:, 1) == maxC1NV(3) | ...
                        C1NV(:, 1) == maxC1NV(4) | ...
                        C1NV(:, 1) == maxC1NV(5) | ...
                        C1NV(:, 1) == maxC1NV(6) | ...
                        C1NV(:, 1) == maxC1NV(7) | ...
                        C1NV(:, 1) == maxC1NV(8) | ...
                        C1NV(:, 1) == maxC1NV(9) | ...
                        C1NV(:, 1) == maxC1NV(10) | ...
                        C1NV(:, 1) == maxC1NV(11) | ...
                        C1NV(:, 1) == maxC1NV(12) | ...
                        C1NV(:, 1) == maxC1NV(13) | ...
                        C1NV(:, 1) == maxC1NV(14) | ...
                        C1NV(:, 1) == maxC1NV(15) | ...
                        C1NV(:, 1) == maxC1NV(16) | ...
                        C1NV(:, 1) == maxC1NV(17) | ...
                        C1NV(:, 1) == maxC1NV(18) | ...
                        C1NV(:, 1) == maxC1NV(19) | ...
                        C1NV(:, 1) == maxC1NV(20));

filasMAXNV(1:20,4) = find(C4NV(:, 1) == maxC4NV(1) | ...
                        C4NV(:, 1) == maxC4NV(2) | ...
                        C4NV(:, 1) == maxC4NV(3) | ...
                        C4NV(:, 1) == maxC4NV(4) | ...
                        C4NV(:, 1) == maxC4NV(5) | ...
                        C4NV(:, 1) == maxC4NV(6) | ...
                        C4NV(:, 1) == maxC4NV(7) | ...
                        C4NV(:, 1) == maxC4NV(8) | ...
                        C4NV(:, 1) == maxC4NV(9) | ...
                        C4NV(:, 1) == maxC4NV(10) | ...
                        C4NV(:, 1) == maxC4NV(11) | ...
                        C4NV(:, 1) == maxC4NV(12) | ...
                        C4NV(:, 1) == maxC4NV(13) | ...
                        C4NV(:, 1) == maxC4NV(14) | ...
                        C4NV(:, 1) == maxC4NV(15) | ...
                        C4NV(:, 1) == maxC4NV(16) | ...
                        C4NV(:, 1) == maxC4NV(17) | ...
                        C4NV(:, 1) == maxC4NV(18) | ...
                        C4NV(:, 1) == maxC4NV(19) | ...
                        C4NV(:, 1) == maxC4NV(20));

filasMAXNV(1:20,5) = find(T4NV(:, 1) == maxT4NV(1) | ...
                        T4NV(:, 1) == maxT4NV(2) | ...
                        T4NV(:, 1) == maxT4NV(3) | ...
                        T4NV(:, 1) == maxT4NV(4) | ...
                        T4NV(:, 1) == maxT4NV(5) | ...
                        T4NV(:, 1) == maxT4NV(6) | ...
                        T4NV(:, 1) == maxT4NV(7) | ...
                        T4NV(:, 1) == maxT4NV(8) | ...
                        T4NV(:, 1) == maxT4NV(9) | ...
                        T4NV(:, 1) == maxT4NV(10) | ...
                        T4NV(:, 1) == maxT4NV(11) | ...
                        T4NV(:, 1) == maxT4NV(12) | ...
                        T4NV(:, 1) == maxT4NV(13) | ...
                        T4NV(:, 1) == maxT4NV(14) | ...
                        T4NV(:, 1) == maxT4NV(15) | ...
                        T4NV(:, 1) == maxT4NV(16) | ...
                        T4NV(:, 1) == maxT4NV(17) | ...
                        T4NV(:, 1) == maxT4NV(18) | ...
                        T4NV(:, 1) == maxT4NV(19) | ...
                        T4NV(:, 1) == maxT4NV(20));

filasMAXNV(1:20,6) = find(O1NV(:, 1) == maxO1NV(1) | ...
                        O1NV(:, 1) == maxO2NV(2) | ...
                        O1NV(:, 1) == maxO2NV(3) | ...
                        O1NV(:, 1) == maxO2NV(4) | ...
                        O1NV(:, 1) == maxO2NV(5) | ...
                        O1NV(:, 1) == maxO2NV(6) | ...
                        O1NV(:, 1) == maxO2NV(7) | ...
                        O1NV(:, 1) == maxO2NV(8) | ...
                        O1NV(:, 1) == maxO2NV(9) | ...
                        O1NV(:, 1) == maxO2NV(10) | ...
                        O1NV(:, 1) == maxO2NV(11) | ...
                        O1NV(:, 1) == maxO2NV(12) | ...
                        O1NV(:, 1) == maxO2NV(13) | ...
                        O1NV(:, 1) == maxO2NV(14) | ...
                        O1NV(:, 1) == maxO2NV(15) | ...
                        O1NV(:, 1) == maxO2NV(16) | ...
                        O1NV(:, 1) == maxO2NV(17) | ...
                        O1NV(:, 1) == maxO2NV(18) | ...
                        O1NV(:, 1) == maxO2NV(19) | ...
                        O1NV(:, 1) == maxO2NV(20));

filasMAXNV(1:20,7) = find(O2NV(:, 1) == maxO2NV(1) | ...
                        O2NV(:, 1) == maxO2NV(2) | ...
                        O2NV(:, 1) == maxO2NV(3) | ...
                        O2NV(:, 1) == maxO2NV(4) | ...
                        O2NV(:, 1) == maxO2NV(5) | ...
                        O2NV(:, 1) == maxO2NV(6) | ...
                        O2NV(:, 1) == maxO2NV(7) | ...
                        O2NV(:, 1) == maxO2NV(8) | ...
                        O2NV(:, 1) == maxO2NV(9) | ...
                        O2NV(:, 1) == maxO2NV(10) | ...
                        O2NV(:, 1) == maxO2NV(11) | ...
                        O2NV(:, 1) == maxO2NV(12) | ...
                        O2NV(:, 1) == maxO2NV(13) | ...
                        O2NV(:, 1) == maxO2NV(14) | ...
                        O2NV(:, 1) == maxO2NV(15) | ...
                        O2NV(:, 1) == maxO2NV(16) | ...
                        O2NV(:, 1) == maxO2NV(17) | ...
                        O2NV(:, 1) == maxO2NV(18) | ...
                        O2NV(:, 1) == maxO2NV(19) | ...
                        O2NV(:, 1) == maxO2NV(20));

% Se muestran todas las filas de los valores seleccionados
MAXT3NV = T3NV(filasMAXNV(1:20,1), :);
MAXC3NV = C3NV(filasMAXNV(1:20,2), :);
MAXC1NV = C1NV(filasMAXNV(1:20,3), :);
MAXC4NV = C4NV(filasMAXNV(1:20,4), :);
MAXT4NV = T4NV(filasMAXNV(1:20,5), :);
MAXO1NV = O1NV(filasMAXNV(1:20,6), :);
MAXO2NV = O2NV(filasMAXNV(1:20,7), :);

%% Reproduce los pasos anteriores aplicados en la sección "espejo" de la FFT

FFTD1Zeros= zeros(round(le)-1, 7);  % Se crea la matriz de ceros con dimensiones de la mitad de la señal original x 7
%length(FFTD1Zeros)
FFTD1Mirror= vertcat(FFTD1Zeros, fftD1Magn(round(le):end,:));  % Se concatenan la matriz de ceros y después de la
FFTD1angleMirror= vertcat(FFTD1Zeros, fftD1angle(round(le):end,:));


T3NVMirror(:,1)=FFTD1Mirror(:,1); % Matriz que involucra magnitud, fase y frecuencia
T3NVMirror(:,2)=FFTD1angleMirror(:,1);
T3NVMirror(:,3)=fnewM;

C3NVMirror(:,1)=FFTD1Mirror(:,2);
C3NVMirror(:,2)=FFTD1angleMirror(:,2);
C3NVMirror(:,3)=fnewM;

C1NVMirror(:,1)=FFTD1Mirror(:,3);
C1NVMirror(:,2)=FFTD1angleMirror(:,3);
C1NVMirror(:,3)=fnewM;

C4NVMirror(:,1)=FFTD1Mirror(:,4);
C4NVMirror(:,2)=FFTD1angleMirror(:,4);
C4NVMirror(:,3)=fnewM;

T4NVMirror(:,1)=FFTD1Mirror(:,5);
T4NVMirror(:,2)=FFTD1angleMirror(:,5);
T4NVMirror(:,3)=fnewM;

O1NVMirror(:,1)=FFTD1Mirror(:,6);
O1NVMirror(:,2)=FFTD1angleMirror(:,6);
O1NVMirror(:,3)=fnewM;

O2NVMirror(:,1)=FFTD1Mirror(:,7);
O2NVMirror(:,2)=FFTD1angleMirror(:,7);
O2NVMirror(:,3)=fnewM;


maxT3NVMirror= maxk(T3NVMirror(:,1),20);
maxC3NVMirror= maxk(C3NVMirror(:,1),20);
maxC1NVMirror= maxk(C1NVMirror(:,1),20);
maxC4NVMirror= maxk(C4NVMirror(:,1),20);
maxT4NVMirror= maxk(T4NVMirror(:,1),20);
maxO1NVMirror= maxk(O1NVMirror(:,1),20);
maxO2NVMirror= maxk(O2NVMirror(:,1),20);

%Busca la posición en que se encuentran los valores más altos en magnitud
filasMAXNV(21:40,1) = find(T3NVMirror(:, 1) == maxT3NVMirror(1) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(2) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(3) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(4) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(5) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(6) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(7) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(8) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(9) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(10) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(11) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(12) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(13) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(14) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(15) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(16) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(17) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(18) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(19) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(20));

filasMAXNV(21:40,2) = find(C3NVMirror(:, 1) == maxC3NVMirror(1) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(2) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(3) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(4) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(5) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(6) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(7) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(8) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(9) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(10) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(11) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(12) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(13) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(14) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(15) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(16) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(17) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(18) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(19) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(20));

filasMAXNV(21:40,3) = find(C1NVMirror(:, 1) == maxC1NVMirror(1) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(2) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(3) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(4) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(5) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(6) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(7) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(8) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(9) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(10) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(11) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(12) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(13) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(14) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(15) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(16) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(17) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(18) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(19) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(20));

filasMAXNV(21:40,4) = find(C4NVMirror(:, 1) == maxC4NVMirror(1) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(2) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(3) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(4) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(5) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(6) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(7) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(8) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(9) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(10) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(11) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(12) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(13) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(14) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(15) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(16) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(17) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(18) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(19) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(20));

filasMAXNV(21:40,5) = find(T4NVMirror(:, 1) == maxT4NVMirror(1) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(2) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(3) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(4) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(5) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(6) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(7) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(8) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(9) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(10) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(11) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(12) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(13) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(14) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(15) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(16) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(17) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(18) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(19) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(20));

filasMAXNV(21:40,6) = find(O1NVMirror(:, 1) == maxO1NVMirror(1) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(2) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(3) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(4) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(5) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(6) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(7) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(8) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(9) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(10) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(11) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(12) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(13) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(14) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(15) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(16) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(17) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(18) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(19) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(20));

filasMAXNV(21:40,7) = find(O2NVMirror(:, 1) == maxO2NVMirror(1) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(2) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(3) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(4) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(5) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(6) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(7) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(8) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(9) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(10) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(11) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(12) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(13) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(14) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(15) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(16) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(17) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(18) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(19) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(20));

% Se muestran todas las filas de los valores seleccionados
MAXT3NVMirror = T3NVMirror(filasMAXNV(21:40,1), :);
MAXC3NVMirror = C3NVMirror(filasMAXNV(21:40,2), :);
MAXC1NVMirror = C1NVMirror(filasMAXNV(21:40,3), :);
MAXC4NVMirror = C4NVMirror(filasMAXNV(21:40,4), :);
MAXT4NVMirror = T4NVMirror(filasMAXNV(21:40,5), :);
MAXO1NVMirror = O1NVMirror(filasMAXNV(21:40,6), :);
MAXO2NVMirror = O2NVMirror(filasMAXNV(21:40,7), :);


%% Reconstruir matriz utilizando las 3 magnitudes mayores de cada canal
NM= zeros(lefft,7);
size(NM)

for b = 1:7
    for a = 1:40
        NM(filasMAXNV(a,b),b) = fftD1Magn(filasMAXNV(a,b),b);
    end
end
NM(:,1)

figure
nexttile

plot(f,NM(:,1));grid on;
title('T3 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile

plot(f,NM(:,2)); grid on;
title('C3 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,NM(:,3)); grid on;
title('C1 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,NM(:,4)); grid on;
title('C4 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,NM(:,5)); grid on;
title('T4 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
grid on

nexttile
%plot (data.Tiempo,data.E1);
plot(f,NM(:,6)); grid on;
title('O1 con FFT')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')


nexttile
%plot (data.Tiempo,data.E1);
plot(f,NM(:,7)); grid on;
title('O2 con FFT')
xlabel('frecuencia (Hz)')
ylabel('Magnitud')
%% Restar el vector obtenido al vector equivalente a la señal original

