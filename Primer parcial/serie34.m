%Serie 3 Primer Parcial 0980 proyectos
%Programa 4
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))

disp("----------Seguimiento de pedidos----------\n")
%base de datos: pedidos
opcion=0;
while opcion ~=4;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo pedido\n 2. Actualizar información producto existente(marca)\n 3. Eliminar pedido\n 4. salir\n ");
switch opcion
   case 1
    try
       co= input('Código: ');
       pe=input('Pedido:',"s");
       ma=input('Marca: ',"s");
      % pq_exec_params (conn,
               % "insert into complex_complex_bool_array values ($1);",
                %{d_c2},
                %setdbopts ("param_types", {"complex_complex_bool_array_type"}))
       N=pq_exec_params(conn, "insert into pedidos values ($1,$2,$3);",{co,pe,ma})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al ingresar nuevo pedido.');
     end_try_catch
   case 2
     try
      opcion2=input("Ingrese el campo a editar:\n 1. Pedido\n 2. Marca\n");
      switch opcion2
      case 1
        co_old= input('Código:');
        pe_old= input('Nombre pedido antigua: ',"s");
        pe_new= input('Nombre pedido nuevo: ',"s");

       %% cambiar, update redes set carnet = 9999 where carnet = 201902150;
        N=pq_exec_params(conn, "update pedidos set pedido= ($1) where codigo=($2);",{pe_new,co_old})
      case 2
        co_old= input('Código:');
        ma_old= input('Marca antiguo: ',"s");
        ma_new= input('Marca nueva: ',"s");
        N=pq_exec_params(conn, "update pedidos set marca= ($1) where codigo=($2);",{ma_new,co_old})
      endswitch
     catch
      disp('Error al editar pedido.');
     end_try_catch
   case 3
     try
      %postdelete from redes where carnet= 201902148;
      co_old = input('Código a eliminar: ');
      %cambiar, update redes set carnet = 9999 where carnet = 201902150;
      N=pq_exec_params(conn, "delete from pedidos where codigo = ($1);",{co_old})
     catch
      disp('Error no se elimino el pedido');
     end_try_catch
   case 4
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
