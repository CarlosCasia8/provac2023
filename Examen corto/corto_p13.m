#Examen corto
#Programa: Grupo de taxis
#tabla: taxi
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
opcion=0;
e1=input("Ingrese el estado 1 posible del taxi; \n","s");
e2=input("Ingrese el estado 2 posible del taxi; \n","s");
e3=input("Ingrese el estado 3 posible del taxi; \n","s");
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Ingresar datos del taxi.\n 2. Ver Historial.\n 3. salir.\n");
switch opcion
   case 1
    try
           anno=input("Ingresa el año del taxi: \n");
           recorrido=input("Ingresa el recorrido del taxi: \n")
            if anno < 2007
              fprintf("Debe renovarse con un recorrido de %f\n",recorrido);
              N=pq_exec_params(conn, "insert into taxi values($1,$2,$3);",{anno,recorrido,e1})
                file = fopen('salida13.txt', 'w');
                fprintf(file,"Debe renovarse con un recorrido de %f\n",recorrido);
                fclose(file);
              elseif (anno >= 2007) && (anno <= 2013)
              fprintf("Debe recibir mantenimiento con un recorrido de %f\n",recorrido);
              N=pq_exec_params(conn, "insert into taxi values($1,$2,$3);",{anno,recorrido,e2})
                file = fopen('salida13.txt', 'w');
                fprintf(file,"Debe recibi mantenimiento con un recorrido de %f.\n",recorrido);
                fclose(file);
              else
                if anno > 2013
                fprintf("Esta en optimas condiciones con un recorrido de %f\n",recorrido);
              N=pq_exec_params(conn, "insert into taxi values($1,$2,$3);",{anno,recorrido,e3})
                file = fopen('salida13.txt', 'w');
                fprintf(file,"Esta en optimos condiciones con un recorrido de %f\n",recorrido);
                fclose(file);
                endif
            endif
     catch
            fprintf("Ocurrio un error mecanico");
     end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'select * from taxi;') %ver datos en la tabla
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
