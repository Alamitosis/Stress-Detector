En la presente carpeta anonimizada, se pueden observar los archivos "EEG_000x.txt" y "tiempo_000x.txt", donde "x" se
refiere al número de archivo generado por el programa LABVIEW.

El archivo "tiempo_000x.txt" contiene un vector o columna , donde cada valor corresponde a su fila equivalente dentro del 
archivo "EEG_000x.txt" y el contenido de cada valor equivale a la hora, minuto y segundo en que se realizó el registro de 
la señal equivalente.

Dentro del archivo "EEG_000x.txt" se encuentra en la primera columna el tiempo en que se realizó la medición (en segundos)
iniciando desde el segundo 0 donde se realiza la primera medición. En las columnas siguientes se muestra la medición en 
magnitud de voltaje de cada electrodo, donde  la segunda columna equivale a la medición en el electrodo T3, la tercera 
columna equivale a la medición en el electrodo C3, la cuarta columna equivale a la medición en el electrodo C1, la quinta
columna equivale a la medición en el electrodo C4, la sexta columna equivale a la medición en el electrodo T4, la séptima 
columna equivale a la medición en el electrodo O1, y la octava columna equivale a la medición en el electrodo O2.
 
Cada archivo de texto contiene un total de 179 muestras y, si el número de muestras lo excede, se creará el siguiente archivo
de texto.  