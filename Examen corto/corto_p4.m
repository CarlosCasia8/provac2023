#Examen corto
#Programa: s4umatoria de un números
#Tabla: sum
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
try
num=input('Ingrese un número');
    sum=0;
    for i = 0:num
       sum = sum + i;
    endfor
    resultado=sum;
    fprintf('La sumatoria de los números del 0 al %d es: %d \n',num, resultado);
    N=pq_exec_params(conn, "insert into sum values($1);",{resultado})
      #.txt
         file = fopen('salida4.txt', 'w');
         fprintf(file, 'El resultado es: %f\n', resultado);
         fclose(file);
catch
        disp('Al calcular la sumatorio');
end_try_catch

