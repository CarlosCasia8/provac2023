%Serie 3 Primer Parcial 0980 proyectos
%Programa 2
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost',...
'port','5432','user','postgres','password','darker'))

disp("----------Seguimiento de pedidos----------\n")
%base de datos: presupuesto
opcion=0;
K=pq_exec_params(conn, "insert into presupuesto values ($1,$2,$3);",{9999,'subtotal',0})
while opcion ~=5;
opcion=input("Ingresa la opción a realizar:\n 1. Agregar nuevo gastos\n 2. Ver un resumen de los gastos acumulados\n 3. Eliminar\n 4. Ajustar el presupuesto\n 5. salir\n ");
switch opcion
   case 1
    try
       co= input('Código: ');
       ga=input('Gasto:',"s");
       ca=input('Cantidad: ');
       ttt=input('Ingrese el saldo total anterior: ') +ca;
      % pq_exec_params (conn,
               % "insert into complex_complex_bool_array values ($1);",
                %{d_c2},
                %setdbopts ("param_types", {"complex_complex_bool_array_type"}))
       N=pq_exec_params(conn, "insert into presupuesto values ($1,$2,$3);",{co,ga,ca})
       M=pq_exec_params(conn, "update presupuesto set cantidad= ($1) where codigo=($2);",{ttt,9999})
       %N=pq_exec_params(conn, 'select * from studio;')
     catch
       disp('Error al ingresar nuevo gasto.');
     end_try_catch
   case 2
     try
       %N=pq_exec_params(conn, 'select * from redes;') %ver datos en la tabla
        N=pq_exec_params(conn, 'select * from presupuesto;')
     catch
      disp('Error al editar pedido.');
     end_try_catch
   case 3
     try
      %postdelete from redes where carnet= 201902148;
      co_old = input('Código a eliminar: ');
      %cambiar, update redes set carnet = 9999 where carnet = 201902150;
      N=pq_exec_params(conn, "delete from presupuesto where codigo = ($1);",{co_old})
     catch
      disp('Error no se elimino el pedido');
     end_try_catch
   case 4
     try
       salario=input('Ingrese su salario(Q) : ');
       ga_sub=input('Ingrese el total de gastos Q): ');
       ga_aj=salario-ga_sub;
       L=pq_exec_params(conn, "update presupuesto set gasto= ($1) where codigo=($2);",{'Ajuste',9999})
       N=pq_exec_params(conn, "update presupuesto set cantidad= ($1) where codigo=($2);",{ga_aj,9999})

       %N=pq_exec_params(conn, "insert into presupuesto values ($1,$2,$3);",{co,ga,ca})
     catch
     end_try_catch
   case 5
     %Salir
      disp('Saliendo del programa...');
   otherwise
      disp('Opción no válida.');
endswitch
endwhile
