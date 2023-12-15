# Examen corto
# Programa: PEDIR 3 NÚMERONS
# Tabla: tres

pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))

disp("-----------------Ingrese 3 números-----------------")
a=input("Valor del número uno: \n ");
b=input("Valor del número dos: \n ");
c=input("Valor del número tres: \n ");

if a == b == c
  disp("Todos son iguales");
  elseif a == b
  fprintf("El distinto es: %0.0f\n",c);

else
  if c == a
    fprintf("El distinto es: %0.0f\n",b);
    elseif b == c
     fprintf("El distinto es: %0.0f\n",a);
  endif
endif

if a > b || a > c
        k=a+b+c;
        fprintf("La sumas de los numeros es: |%0.0f|\n", k);
         #.txt
         file = fopen('salida1.txt', 'w');
         fprintf(file, 'El resultado es: %f\n', k);
         fclose(file);
         #Postgres
        N=pq_exec_params(conn, "insert into tres values($1,$2);",{'suma',k})

    elseif c>= b
        if c == b
          elseif c>b
          fprintf("Los números son :  |%0.0f|,  |%0.0f|,  |%0.0f|   \n", a,b,c);

        endif
    else
        l=a*b*c;
        fprintf("La multiplicación de los numeros es: |%0.0f|\n", l);
endif

