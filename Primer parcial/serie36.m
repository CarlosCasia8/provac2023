%Serie 3 Primer Parcial 0980 proyectos
%Programa 6
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))
disp("----------Registro de estudiantes----------\n")
%base de datos: sensor
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Selección del sensor\n 2. Ver resultados\n 3. Salir\n ");
switch opcion
   case 1
    try
      opcion2=0;
      opcion2=input("Seleciona entre:\n 1. Sensor de temperatura\n 2. Sensor de humedad relativa\n 3. Salir\n ");
      switch opcion2
        case 1
          disp('Muestra de los datos de temperatura.\n');
          a=input("Ingresa un valor de temperatura:\n");
          b=input("Ingresa un valor de temperatura:\n");
          c=input("Ingresa un valor de temperatura:\n");
          mu=(a+b+c)/3;
        if mu >= 25
          fprintf("La temperatura promedio de la muestra es: %f promedio.\n",mu);
         N=pq_exec_params(conn, "insert into sensor values($1,$2,$3,$4);",{a,b,c, mu})
           p1 = [a,1];
            p2 = [b,2];
            p3 = [c,3];
            t = [p1, p2, p3];
              figure();
              plot(t,'b')
              xlabel('tiempo'); ylabel('Tendencia');
       elseif mu < 20
        fprintf("La temperatura promedio de la muestra es: %f promedio.\n",mu);
            p1 = [a,1];
            p2 = [b,2];
            p3 = [c,3];
            t = [p1, p2, p3];
              figure();
              plot(t,'b')
              xlabel('tiempo'); ylabel('Precio de venta');
       N=pq_exec_params(conn, "insert into sensor values($1,$2,$3,$4);",{a,b,c, mu})
      endif
        case 2
          disp('Muestra de los datos de humedad.\n');
          a=input("Ingresa un valor de humedad:\n");
          b=input("Ingresa un valor de humedad:\n");
          c=input("Ingresa un valor de humedad:\n");
          mu=(a+b+c)/3;
        if mu >= 75
          fprintf("La humedad promedio de la muestra es alta con un valor de: %f porciento.\n",mu);
         N=pq_exec_params(conn, "insert into sensor values($1,$2,$3,$4);",{a,b,c, mu})
           p1 = [a,1];
            p2 = [b,2];
            p3 = [c,3];
            t = [p1, p2, p3];
              figure();
              plot(t)
              xlabel('tiempo'); ylabel('Tendencia');
       elseif mu < 75
        fprintf("La humedad promedio de la muestra es baja con un valor de: %f prociento.\n",mu);
            p1 = [a,1];
            p2 = [b,2];
            p3 = [c,3];
            t = [p1, p2, p3];
              figure();
              plot(t,'b')
              xlabel('tiempo'); ylabel('Precio de venta');
        N=pq_exec_params(conn, "insert into sensor values($1,$2,$3,$4);",{a,b,c, mu})
      endif
        otherwise
           disp('Opción no válida.');
      endswitch
     catch
       disp('Error al escojer sensor.');
     end_try_catch
   case 2
     try
        #N=pq_exec_params(conn, 'select * from sensor;') %ver datos en la tabla
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
