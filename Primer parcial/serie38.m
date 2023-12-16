%Serie 3 Primer Parcial 0980 proyectos
%Programa 7
#tabla: fin
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
disp("----------Analisis financiero----------\n")
opcion=0;
while opcion ~=2;
opcion=input("Ingresa la opción a realizar:\n 1. Análisis finaciero.\n 2. salir.\n");
switch opcion
   case 1
    try
      disp('Ingrese el ingreso total y egreso total del ultimo año de la empresa');
      nom=input("Ingrese el nombre de la empresa\n","s");
      i1=input("Ingrese el ingreso; \n");
      e1=input("Ingrese el egreso:\n");
      e3=(i1-e1);
            if e3 < 10000
              fprintf("La empresa esta quebrada con %f por lo tanto no invertir\n",e3);
              N=pq_exec_params(conn, "insert into fin values($1,$2,$3,$4);",{nom,i1,e1,e3})

              elseif (e3 >= 10000) && (e3 <= 50000)
              fprintf("La empresa esta binen %f por lo tanto es posible invertir\n",e3);
              N=pq_exec_params(conn, "insert into fin values($1,$2,$3,$4);",{nom,i1,e1,e3})
              else
                if e3 > 50000
                fprintf("La empresa esta optimas condiciones con %f esta lista para invertir\n",recorrido);
                N=pq_exec_params(conn, "insert into fin values($1,$2,$3,$4);",{nom,i1,e1,e3})
                endif
            endif
     catch
            fprintf("Ocurrio un error mecanico");
     end_try_catch
   case 2
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
