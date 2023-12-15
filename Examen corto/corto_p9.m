#Examen corto
#Programa: Tipo de triangulo
#Tabla: tri
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
disp("-----------------Tipo de triangulo-----------------")
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar medidas\n 2. Ver Historial \n 3. salir\n ");
switch opcion
   case 1
try
      a=input("Ingrese el valor del lado uno: \n ");
      b=input("Ingrese el valor del lado dos: \n ");
      c=input("Ingrese el valor del lado tres: \n ");
       if a == b == c
         N=pq_exec_params(conn, "insert into tri values($1,$2,$3,$4);",{a,b,c,'equilatero'})
         fprintf("Es un triangulo: Equilátero");
       elseif a == c
          N=pq_exec_params(conn, "insert into tri values($1,$2,$3,$4);",{a,b,c,'isoceles'})
          fprintf("Es un triangulo: Isóceles.\n");
         else
            if a != b !=c
              N=pq_exec_params(conn, "insert into tri values($1,$2,$3,$4);",{a,b,c,'escaleno'})
              fprintf("Es un triangulo: Escaleno.\n");
            endif
       endif
catch
       disp('Ocurrio un error.');
end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'select * from tri;') %ver datos en la tabla
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
