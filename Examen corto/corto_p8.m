#Examen corte
#Programas: mostrar los números impares desde 0 a 100.
#tabla: impar
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
try
contar=0;
  for num = 1:2:100
    fprintf('%d\n', num);
    contar=contar + 1;
  end
fprintf("El numero de impares es: %f.",contar);
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo número\n 2. Ver Historial \n 3. salir\n ");
switch opcion
   case 1
    try
     N=pq_exec_params(conn, "insert into impar values($1);",{contar})
     file = fopen('salida8.txt', 'w');
         fprintf(file, 'El resultado es: %f\n', contar);
         fclose(file);
     catch
       disp('Ocurrio un error.');
     end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'Select * from impar;') %ver datos en la tabla
     catch
      disp('Ocurrio un error.');
     end_try_catch
   case 3
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
catch
  disp('Error el conectar.');
end_try_catch


