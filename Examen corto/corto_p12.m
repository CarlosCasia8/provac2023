#Examen corto
#Programa: promedio
#tabla: pro
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
disp("----------Calculadora de notas----------\n")
opcion=0;
ad=input('podria ser:',"s");
rep=input('podria ser:',"s");
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Calcular nota\n 2. Ver Historial \n 3. salir\n ");
switch opcion
   case 1
    try
      a=input("Valor del la primera nota: \n ");
      b=input("Valor del la segunda nota: \n ");
      c=input("Valor del la tercera nota: \n ");

      mu=(a+b+c)/3;

      if mu >= 60
        fprintf("Aprobado con la nota: %f \n",mu);
        N=pq_exec_params(conn, "insert into pro values($1,$2,$3,$4,$5);",{a, b, c, mu, ad})
         file = fopen('salida12.txt', 'w');
         fprintf(file, 'El resultado es aprobado: %f\n, %f\n, %f\n, promedio: %f\n',a,b,c,mu);
         fclose(file);
         elseif mu < 60
            fprintf("Reprobado con la nota: %f \n",mu);
            N=pq_exec_params(conn, "insert into pro values($1,$2,$3,$4,$5);",{a, b, c, mu, rep})
         file = fopen('salida12.txt', 'w');
         fprintf(file, 'El resultado es reprobado: %f\n, %f\n, %f\n, promedio: %f\n',a,b,c,mu);
         fclose(file);
      endif

       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Ocurrio un error.');
     end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'select * from pro;') %ver datos en la tabla
     catch
      disp('Error al ver el historial.');
     end_try_catch
   case 3
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
