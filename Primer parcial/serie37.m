%Serie 3 Primer Parcial 0980 proyectos
%Programa 7
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))
disp("----------Recomendación de películas----------\n")
%base de datos: peli
opcion=0;
while opcion ~=2;
opcion=input("Ingresa la opción a realizar:\n 1. Gustos sobre películas\n 2. Salir\n ");
switch opcion
   case 1
          a=input("Ingresa el nombre de una película:\n","s");
          b=input("Ingresa el nombre de una película:\n","s");
          c=input("Ingresa el nombre de una película:\n","s");;
          disp("Escibe tus 3 generos\n");
          a1=input("Genero uno:\n","s");
          a2=input("Valoración segén estrellas(5-muy buena, 3-normal, 1-mala):\n");
          b1=input("Genero dos:\n","s");
          b2=input("Valoración segén estrellas(5-muy buena, 3-normal, 1-mala):\n");
          c1=input("Genero tres:\n","s");
          c2=input("Valoración(según estrellas(5-muy buena, 3-normal, 1-mala):\n");
    try
      if a2==5
        #    fprintf('El factorial de %d es %d\n', n, factorial); %d entero positivo
         fprintf('recomendación de película de %d estrellas es: El exorsista\n',a2);
         N=pq_exec_params(conn, "insert into peli values($1,$2,$3,$4,$5);",{a,b,c,a1,a2})
       elseif b2==5

             fprintf("recomendación de %d es: Pacific Rin\n",b2);
             N=pq_exec_params(conn, "insert into peli values($1,$2,$3,$4,$5);",{a,b,c,b1,b2})
       else
         if c2==5
                      fprintf("recomendación de: %f es: El señor de los anillos\n",c2);
                      N=pq_exec_params(conn, "insert into peli values($1,$2,$3,$4,$5);",{a,b,c,c1,c2})

                 endif
      endif
     catch
       disp('Error en películas.');
     end_try_catch
   case 2
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
