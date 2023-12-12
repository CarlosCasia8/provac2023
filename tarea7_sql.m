%Serie 3 Primer Parcial 0980 proyectos
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
%N=pq_exec_params(conn, "update redes set carnet = 9999 where carnet = 201902150;") %insertar datos en la tabla
%N=pq_exec_params(conn, 'select * from redes;') %ver datos en la tabla
% cambiar, update redes set carnet = 9999 where carnet = 201902150;
% insertar, insert into redes values ('ban','202302156');
% eliminar, postdelete from redes where carnet= 201902148;
disp("----------Calculadora de IVA----------\n")
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo número\n 2. Ver Historial \n 3. salir\n ");
switch opcion
   case 1
    try
       precio= input('Precio:');
       IVA=precio*0.12;
       precio_sin_iva=precio - IVA;
       fprintf("El precio sin IVA es Q%0.0f , por lo que el IVA es: Q%0.0f\n", precio_sin_iva, IVA);
       N=pq_exec_params(conn, "insert into iva values($1,$2,$3);",{precio, precio_sin_iva, IVA})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al calcular el precio del iva.');
     end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'select * from iva;') %ver datos en la tabla
     catch
      disp('Error al ver el historial de precios.');
     end_try_catch
   case 3
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
