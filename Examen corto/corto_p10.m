#Examen corto
#Programa: Factorial sin es divisible
#tabla: fac
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))

num= input("Ingrese un numero para obtener su factorial. \n");
if mod(num, 7) == 0
      disp('El número es divisible por 7');
      try
       n = num;
      % Calcular el factorial usando la función calcularFactorial
      if n < 0
          error('El factorial no está definido para números negativos.');
      elseif n == 0 || n == 1
          factorial = 1;
      else
          factorial = 1;
          for i = 2:n
              factorial = factorial * i;
          end
      end
      % Mostrar el resultado
      fprintf('El factorial de %d es %d\n', n, factorial); %d entero positivo
      N=pq_exec_params(conn, "insert into fac values($1,$2);",{num,factorial})
      file = fopen('salida10.txt', 'w');
         fprintf(file, 'El resultado es: %f\n', factorial);
         fclose(file);
      catch
      % Manejar el error si el usuario ingresa un número negativo o no entero
      fprintf("Ocurrio un error");
      end_try_catch
else
    disp('El número no es divisible por 7');
endif
