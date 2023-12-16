%Serie 3 Primer Parcial 0980 proyectos
%Programa 3
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))

disp("----------Gestión de inventario----------\n")
%Base de datos: inventario
opcion=0;
while opcion ~=4;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo producto\n 2. Actualizar información producto existente(precio)\n 3. Eliminar producto\n 4. salir\n ");
switch opcion
   case 1
    try
       co= input('Código: ');
       pr=input('Producto:',"s");
       pre=input('Precio: ');
      % pq_exec_params (conn,
               % "insert into complex_complex_bool_array values ($1);",
                %{d_c2},
                %setdbopts ("param_types", {"complex_complex_bool_array_type"}))
       N=pq_exec_params(conn, "insert into inventario values ($1,$2,$3);",{co,pr,pre})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al ingresar nuevo producto.');
     end_try_catch
   case 2
     try
      opcion2=input("Ingrese el campo a editar:\n 1.Producto\n 2. Precio\n");
      switch opcion2
      case 1
        co_old= input('Código:');
        pr_old= input('Nombre old: ',"s");
        pr_new= input('Nombre nuevo: ',"s");
       %% cambiar, update redes set carnet = 9999 where carnet = 201902150;
        N=pq_exec_params(conn, "update inventario set producto= ($1) where codigo=($2);",{pr_new,co_old})
      case 2
        co_old= input('Código:');
        pre_old= input('Precio antiguo: ');
        pre_new= input('Precio nuevo: ');
        N=pq_exec_params(conn, "update inventario set precio= ($1) where codigo=($2);",{pre_new,co_old})
      endswitch
     catch
      disp('Error al editar información.');
     end_try_catch
   case 3
     try
      %postdelete from redes where carnet= 201902148;
      co_old = input('Producto a eliminar codigo: ');
      %cambiar, update redes set carnet = 9999 where carnet = 201902150;
      N=pq_exec_params(conn, "delete from inventario where codigo = ($1);",{co_old})
     catch
      disp('Error no se elimino al estudiante');
     end_try_catch
   case 4
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
