%Serie 3 Primer Parcial 0980 proyectos
%Programa 5
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))

disp("----------Monitoreo de ventas----------\n")
%base de datos: pedidos
opcion=0;
while opcion ~=4;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nueva venta\n 2. Actualizar información de la venta\n 3. Analizar\n 4. salir\n ");
switch opcion
   case 1
    try
       co= input('Código: ');
       pe=input('Producto de venta:',"s");
       ve=input('Precio de venta: ');
      % pq_exec_params (conn,
               % "insert into complex_complex_bool_array values ($1);",
                %{d_c2},
                %setdbopts ("param_types", {"complex_complex_bool_array_type"}))
       N=pq_exec_params(conn, "insert into ventas values ($1,$2,$3);",{co,pe,ve})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al ingresar nueva venta.');
     end_try_catch
   case 2
     try
      opcion2=input("Ingrese el campo a editar:\n 1. Producto de venta\n 2. Precio de venta\n");
      switch opcion2
      case 1
        co_old= input('Código:');
        pe_old= input('Nombre de la venta antigua: ',"s");
        pe_new= input('Nombre de la venta nuevo: ',"s");

       %% cambiar, update redes set carnet = 9999 where carnet = 201902150;
        N=pq_exec_params(conn, "update ventas set nombre= ($1) where codigo=($2);",{pe_new,co_old})
      case 2
        co_old= input('Código:');
        ve_old= input('Precio de la venta antigua: ');
        ve_new= input('Precio de la venta nueva: ');
        N=pq_exec_params(conn, "update ventas set precio= ($1) where codigo=($2);",{ve_new,co_old})
      endswitch
     catch
      disp('Error al actualizar.');
     end_try_catch
   case 3
     try
       fprintf("Ingresa los ultimos 3 datos de la tabla");
      %postdelete from redes where carnet= 201902148;
      #co_old = input('Código a eliminar: ');
      %cambiar, update redes set carnet = 9999 where carnet = 201902150;
      #N=pq_exec_params(conn, "delete from pedidos where codigo = ($1);",{co_old})
      a=input("Ingresa datos:\n");
      b=input("Ingresa datos:\n");
      c=input("Ingresa datos:\n");
      mu=(a+b+c)/3;

      if mu >= 300
        fprintf("El precio promedio de los productos en venta es alto con un valor de: %f \n",mu);
        #N=pq_exec_params(conn, "insert into ventas values($1,$2,$3,$4,$5);",{0, '-', c, mu, ad})
         #file = fopen('salida12.txt', 'w');
         #fprintf(file, 'El resultado es aprobado: %f\n, %f\n, %f\n, promedio: %f\n',a,b,c,mu);
         p1 = [a,1];
          p2 = [b,2];
          p3 = [c,3];
          % Crear triángulo
          t = [p1, p2, p3];
              figure();
              plot(t,'b')
              xlabel('tiempo'); ylabel('Precio de venta');
        # fclose(file);
         elseif mu < 300
        fprintf("El precio promedio de los productos en venta es bajo con un valor de: %f \n",mu);
                 p1 = [a,1];
          p2 = [b,2];
          p3 = [c,3];
          % Crear triángulo
          t = [p1, p2, p3];
              figure();
              plot(t,'b')
              xlabel('tiempo'); ylabel('Precio de venta');
           # N=pq_exec_params(conn, "insert into ventas values($1,$2,$3,$4,$5);",{a, b, c, mu, rep})
         #file = fopen('salida12.txt', 'w');
       #  fprintf(file, 'El resultado es reprobado: %f\n, %f\n, %f\n, promedio: %f\n',a,b,c,mu);
       #  fclose(file);
      endif
     catch
      disp('Error analizar los datos');
     end_try_catch
   case 4
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
