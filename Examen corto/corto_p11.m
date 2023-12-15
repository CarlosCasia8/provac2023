#Examen corto
#Programa: AREA
#tabla: ar
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
opcion=0;
while opcion ~=3;
opcion=input("Ingresa la opción a realizar:\n 1. Calcular área.\n 2. Ver Historial.\n 3. salir.\n");
switch opcion
   case 1
    try
      opcion2 = input("Ingrese el número correspondiente a la figura:\n 1.Circulo \n 2.Triangulo \n 3.Cuadrado \n 4.Rectangulo \n");
    switch opcion2
        case 1
          try
            radio = input('Ingrese el radio del círculo: ');
            area1 = pi * radio^2;
            cir=input('Ingresa la figura: ',"s");
            printf('El área del círculo es: %.2f\n', area1);
            N=pq_exec_params(conn, "insert into ar values($1,$2);",{cir,area1})
            file = fopen('salida11.txt', 'w');
            fprintf(file, 'Área circulo = %f\n', area1);
            fclose(file);
          catch
            fprintf("Ocurrio un error");
          end_try_catch
        case 2
          try
            base = input('Ingrese la base del triángulo: ');
            altura = input('Ingrese la altura del triángulo: ');
            tri=input('Ingresa la figura: ',"s");
            area2 = 0.5 * base * altura;
            printf('El área del triángulo es: %.2f\n', area2);
            N=pq_exec_params(conn, "insert into ar values($1,$2);",{tri,area2})
            file = fopen('salida11.txt', 'w');
            fprintf(file, 'Área triangulo = %f\n', area2);
            fclose(file);
          catch
            fprintf("Ocurrio un error");
          end_try_catch
        case 3
           try
            lado = input('Ingrese el lado del cuadrado: ');
            area3 = lado^2;
            cua=input('Ingresa la figura: ',"s");
            printf('El área del cuadrado es: %.2f\n', area3);
            N=pq_exec_params(conn, "insert into ar values($1,$2);",{cua,area3})
            #file = fopen('salida11.txt', 'w');
            #fprintf(file, 'Área cuadrado = %f\n', area3);
            #fclose(file);
          catch
            fprintf("Ocurrio un error");
          end_try_catch
        case 4
           try
            base = input('Ingrese la base del rectángulo: ');
            altura = input('Ingrese la altura del rectángulo: ');
            rec=input('Ingresa la figura: ',"s");
            area4 = base * altura;
            printf('El área del rectángulo es: %.2f\n', area4);
            N=pq_exec_params(conn, "insert into ar values($1,$2);",{rec,area4})
            file = fopen('salida11.txt', 'w');
            fprintf(file, 'Área regtangulo = %f\n', area4);
            fclose(file);
          catch
            fprintf("Ocurrio un error");
          end_try_catch
        otherwise
            printf('Opción inválida, por favor intente de nuevo.\n');
    endswitch
      # N=pq_exec_params(conn, "insert into iva values($1,$2,$3);",{precio, precio_sin_iva, IVA})
     catch
       disp('Ocurrio un error.');
     end_try_catch
   case 2
     try
      N=pq_exec_params(conn, 'select * from ar;') %ver datos en la tabla
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
