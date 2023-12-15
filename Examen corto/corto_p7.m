#Examen corto
#Programa: Número de vocales
#word=input("Ingrese una palabra: \n");
#s = num2str(a);
try
word = 'electronica'
  word= lower(word); % convertir a minúsculas
  vowels = 'aeiou'; % definir las vocales
  vocalCount = zeros(1, length(vowels)); % inicializar el vector de contadores

  for i = 1:length(word)
          for j = 1:length(vowels)
              if word(i) == vowels(j)
                  vocalCount(j) = vocalCount(j) + 1; % incrementar el contador correspondiente
                  break; % salir del bucle interno
              endif
          endfor
  endfor
disp("   a   e   i   o   u");
disp(vocalCount);
 #.txt
         file = fopen('salida7.txt', 'w');
         fprintf(file, 'El resultado es: %f\n', vocalCount);
         fclose(file);
catch
         dis('Error al contar el número de vocales.');
end_try_catch
