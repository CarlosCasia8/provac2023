#Examen corto
#Programa: INICIO Y FINAL DE 2 EN 2
try
  % número inicial y final
ini = input("Ingresar el número de inicio \n");
fin = input("Ingresar el número final \n");
file = fopen('salida5.txt', 'w');
for num = ini:2:fin
    % Muestra el número en la pantalla
    disp(num);

         fprintf(file, "El resultado es: %f\n", num);


end
         fclose(file);

catch
 disp('Ocurrio un error');
end_try_catch
