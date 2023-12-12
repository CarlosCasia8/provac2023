if(exist('OCTAVE_VERSION','builtin')~=0)
%estamos en octave
pkg load signal;
endif
% menú principal
opcion = 0;
while opcion ~=5;
  %opcion = input('Selecione una opcion:\n 1. Grabar audio\n 2. Reproducir audio\n 3. Graficar audio\n 4 Salir\n');
  %menú de opciones
  disp('Selecione una opción:')
  disp('1. Grabar')
  disp('2. Reproducir')
  disp('3. Graficar')
  disp('4. Graficar densidad')
  disp('5. Salir')
  opcion= input('Ingrese su elección: ');
  switch opcion
    case 1
      % grabacion de audio
      try
        durancion = input('Ingrese la duracion de la grabacion en segundos: ');
        disp('Comenzando la grabación...');
        recObj = audiorecorder;
        recordblocking(recObj,10);
        disp('Grabación finalizada.');
        data = getaudiodata(recObj);
        audiowrite('audio.wav',data,recObj.SampleRate);
        disp('Archivo de audio grabado correctamente.');
      catch
        disp('Error al grabar el audio.');
      end_try_catch
    case 2
      %Reproducción del audio
      try
        [data,fs]=audioread('audio.wav');
        sound(data,fs);
      catch
        disp('Error al reproducir el audio.');
      end_try_catch
    case 3
      % Grafico del audio
      try
        [data, fs]=audioread('audio.wav');
        tiempo=linspace(0,length(data)/fs,length(data));
        plot(tiempo,data);
        xlabel('Tiempo(s)');
        ylabel('Amplitud');
        title(Audio);
      catch
        disp('Error al graficar el audio.');
      end_try_catch
    case 4
      % Graficando espectro de frecuencia.
      try
        disp('Graficando espectro de frecuencia...');
        [audio,Fs]=audioread('audio.wav'); %Lee la senal desde el archivo.wav
        N = length(audio); %Número del muestras de la señal.
        f = linspace(0,Fs/2,N/2+1); %Vector de frecuencias.
        ventana = hann(N); %Ventana de Hann para reducir el efecto de los discontinuidades al calcular FFT
        Sxx= pwelch(audio, ventana,0,N,Fs); %Desnsidad espectral de potencia
        plot(f,10*log10(Sxx(1:N/2+1))); % Grafica el espectro de frecuencia en dB.
        xlabel('Frecuancia (Hz)');
        ylabel('Desnsidad espectral de potencia (dB/Hz)');
        title('Espectro de frecuencia de la señal grabada');
      catch
        disp('Error al graficar el audio');
      end_try_catch
    case 5
      %Salir
      disp('Saliendo del programa...');
    otherwise
      disp('Opción no válida.');
  endswitch

 endwhile
