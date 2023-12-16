%Serie 3 Primer Parcial 0980 proyectos
%Programa 10
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))
disp("----------Recomendación de películas----------\n")
%base de datos: prod
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Ingresar productos\n 2. Plan de producción.\n 3. Salir\n ");
switch opcion
   case 1
          a=input("Ingresa el producto número 1:\n","s");
                a1=input("Ingresa el número de piezas\n");
          b=input("Ingresa el producto número 2:\n","s");
                b1=input("Ingresa el número de piezas\n");
          c=input("Ingresa el producto número 3:\n","s");
                c1=input("Ingresa el número de piezas\n");
   case 2
     try
      if a1<=5
        #    fprintf('El factorial de %d es %d\n', n, factorial); %d entero positivo
         fprintf('Producto más optimo en materiales con un total de piezas: %d es el numero 1\n',a1);
         N=pq_exec_params(conn, "insert into prod values($1,$2,$3,$4,$5);",{a,a1,b,b1,c,c1})
       elseif b1<=5

             fprintf('Producto más optimo en materiales con un total de piezas: %d es el numero 2\n',b1);
             N=pq_exec_params(conn, "insert into prod values($1,$2,$3,$4,$5);",{a,a1,b,b1,c,c1})
       else
         if c1<=5
             fprintf('Producto más optimo en materiales con un total de piezas: %d es el numero 3\n',c1);
             N=pq_exec_params(conn, "insert into prod values($1,$2,$3,$4,$5);",{a,a1,b,b1,c,c1})

                 endif
      endif
     catch
       disp('Error en películas.');
     end_try_catch

   case 3
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
