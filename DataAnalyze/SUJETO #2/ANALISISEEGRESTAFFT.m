clc
%% Cargar señal
fs= 256;
data = importdata("EEG_#2.txt");
D1=data(:,2:8);
[m,n] = size(D1);
f = (0:m-1)*((fs)/m);
t= data(:,1);
%% Obtener FFT
fftD1=fft(D1);
fftD1Magn= abs(fft(D1));
fftD1Imag= imag(fft(D1));
fftD1angle= angle(fft(D1));
lefft=length(fftD1);

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


maxT3NV= maxk(T3NV(:,1),3);
maxC3NV= maxk(C3NV(:,1),3);
maxC1NV= maxk(C1NV(:,1),3);
maxC4NV= maxk(C4NV(:,1),3);
maxT4NV= maxk(T4NV(:,1),3);
maxO1NV= maxk(O1NV(:,1),3);
maxO2NV= maxk(O2NV(:,1),3);

%Busca la posición en que se encuentran los valores más altos en magnitud
filasMAXNV(1:3,1) = find(T3NV(:, 1) == maxT3NV(1) | ...
                        T3NV(:, 1) == maxT3NV(2) | ...
                        T3NV(:, 1) == maxT3NV(3));

filasMAXNV(1:3,2) = find(C3NV(:, 1) == maxC3NV(1) | ...
                        C3NV(:, 1) == maxC3NV(2) | ...
                        C3NV(:, 1) == maxC3NV(3));

filasMAXNV(1:3,3) = find(C1NV(:, 1) == maxC1NV(1) | ...
                        C1NV(:, 1) == maxC1NV(2) | ...
                        C1NV(:, 1) == maxC1NV(3));

filasMAXNV(1:3,4) = find(C4NV(:, 1) == maxC4NV(1) | ...
                        C4NV(:, 1) == maxC4NV(2) | ...
                        C4NV(:, 1) == maxC4NV(3));

filasMAXNV(1:3,5) = find(T4NV(:, 1) == maxT4NV(1) | ...
                        T4NV(:, 1) == maxT4NV(2) | ...
                        T4NV(:, 1) == maxT4NV(3));

filasMAXNV(1:3,6) = find(O1NV(:, 1) == maxO1NV(1) | ...
                        O1NV(:, 1) == maxO2NV(2) | ...
                        O1NV(:, 1) == maxO2NV(3));

filasMAXNV(1:3,7) = find(O2NV(:, 1) == maxO2NV(1) | ...
                        O2NV(:, 1) == maxO2NV(2) | ...
                        O2NV(:, 1) == maxO2NV(3));

% Se muestran todas las filas de los valores seleccionados
MAXT3NV = T3NV(filasMAXNV(1:3,1), :);
MAXC3NV = C3NV(filasMAXNV(1:3,2), :);
MAXC1NV = C1NV(filasMAXNV(1:3,3), :);
MAXC4NV = C4NV(filasMAXNV(1:3,4), :);
MAXT4NV = T4NV(filasMAXNV(1:3,5), :);
MAXO1NV = O1NV(filasMAXNV(1:3,6), :);
MAXO2NV = O2NV(filasMAXNV(1:3,7), :);

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


maxT3NVMirror= maxk(T3NVMirror(:,1),3);
maxC3NVMirror= maxk(C3NVMirror(:,1),3);
maxC1NVMirror= maxk(C1NVMirror(:,1),3);
maxC4NVMirror= maxk(C4NVMirror(:,1),3);
maxT4NVMirror= maxk(T4NVMirror(:,1),3);
maxO1NVMirror= maxk(O1NVMirror(:,1),3);
maxO2NVMirror= maxk(O2NVMirror(:,1),3);

%Busca la posición en que se encuentran los valores más altos en magnitud
filasMAXNV(4:6,1) = find(T3NVMirror(:, 1) == maxT3NVMirror(1) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(2) | ...
                        T3NVMirror(:, 1) == maxT3NVMirror(3));

filasMAXNV(4:6,2) = find(C3NVMirror(:, 1) == maxC3NVMirror(1) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(2) | ...
                        C3NVMirror(:, 1) == maxC3NVMirror(3));

filasMAXNV(4:6,3) = find(C1NVMirror(:, 1) == maxC1NVMirror(1) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(2) | ...
                        C1NVMirror(:, 1) == maxC1NVMirror(3));

filasMAXNV(4:6,4) = find(C4NVMirror(:, 1) == maxC4NVMirror(1) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(2) | ...
                        C4NVMirror(:, 1) == maxC4NVMirror(3));

filasMAXNV(4:6,5) = find(T4NVMirror(:, 1) == maxT4NVMirror(1) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(2) | ...
                        T4NVMirror(:, 1) == maxT4NVMirror(3));

filasMAXNV(4:6,6) = find(O1NVMirror(:, 1) == maxO1NVMirror(1) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(2) | ...
                        O1NVMirror(:, 1) == maxO2NVMirror(3));

filasMAXNV(4:6,7) = find(O2NVMirror(:, 1) == maxO2NVMirror(1) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(2) | ...
                        O2NVMirror(:, 1) == maxO2NVMirror(3));

% Se muestran todas las filas de los valores seleccionados
MAXT3NVMirror = T3NVMirror(filasMAXNV(4:6,1), :);
MAXC3NVMirror = C3NVMirror(filasMAXNV(4:6,2), :);
MAXC1NVMirror = C1NVMirror(filasMAXNV(4:6,3), :);
MAXC4NVMirror = C4NVMirror(filasMAXNV(4:6,4), :);
MAXT4NVMirror = T4NVMirror(filasMAXNV(4:6,5), :);
MAXO1NVMirror = O1NVMirror(filasMAXNV(4:6,6), :);
MAXO2NVMirror = O2NVMirror(filasMAXNV(4:6,7), :);


%% Reconstruir matriz utilizando las 3 magnitudes mayores de cada canal
NM= zeros(lefft,7);
size(NM)

for b = 1:7
    for a = 1:6
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

%% Filtración de matriz para números enteros

%% Restar el vector obtenido al vector equivalente a la señal original


