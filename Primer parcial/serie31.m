%Serie 3 Primer Parcial 0980 proyectos
%Programa 1
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))
disp("----------Registro de estudiantes----------\n")
%base de datos: studio
opcion=0;
while opcion ~=4;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo estudiante\n 2. Editar información existente\n 3. Eliminar estudiante\n 4. salir\n ");
switch opcion
   case 1
    try
       nom= input('Nombre: ',"s");
       ed=input('Edad:');
       ge=input('Genero: ',"s");
       dir=input('dirección (Solo zona): ');
      % pq_exec_params (conn,
               % "insert into complex_complex_bool_array values ($1);",
                %{d_c2},
                %setdbopts ("param_types", {"complex_complex_bool_array_type"}))
       N=pq_exec_params(conn, "insert into studio values ($1,$2,$3,$4);",{nom,ed,ge,dir})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al ingresar nuevo estudiante.');
     end_try_catch
   case 2
     try
      opcion2=input("Ingrese el campo a editar:\n 1.nombre\n 2. Edad\n 3. Genero\n 4. direccion\n ");
      switch opcion2
      case 1
        nom_old= input('Nombre antiguo: ',"s");
        nom_new= input('Nombre nuevo: ',"s");
       %% cambiar, update redes set carnet = 9999 where carnet = 201902150;
        N=pq_exec_params(conn, "update studio set nombre= ($1) where nombre=($2);",{nom_new,nom_old})
      case 2
         ed_old=input('Edad antigua:');
         ed_new=input('Edad nueva:');
         N=pq_exec_params(conn, "update studio set edad= ($1) where edad=($2);",{ed_new,ed_old})
      case 3
         ge_old=input('Genero antigua: ',"s");
         ge_new=input('Genero nuevo: ',"s");
         N=pq_exec_params(conn, "update studio set genero= ($1) where genero=($2);",{ge_new,ge_old})
      case 4
         dir_old=input('dirección antigua (Solo zona): ');
         dir_new=input('dirección nueva(Solo zona): ');
         N=pq_exec_params(conn, "update studio set direccion = ($1) where direccion = ($2);",{dir_new,dir_old})
      endswitch
     catch
      disp('Error al editar información.');
     end_try_catch
   case 3
     try
      %postdelete from redes where carnet= 201902148;
      nom = input('Nombre a eliminar: ',"s");
      %cambiar, update redes set carnet = 9999 where carnet = 201902150;
      N=pq_exec_params(conn, "delete from studio where nombre = ($1);",{nom})
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
