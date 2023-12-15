#Programa DIVISORES
#tabla div
pkg load database %cargar el paquete
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','darker'))
num= input('Introduce un numero:')
try
   divisor = [];
    for i = 1:num
        if mod(num, i) == 0
                divisor = [divisor, i];
         endif
    endfor
    disp(divisor)
    s = num2str(divisor)
    #.txt
    file = fopen('salida2.txt', 'w');
    fprintf(file, 'El resultado es: %f\n', divisor);
    fclose(file);
    N=pq_exec_params(conn, "insert into div values($1);",{s})
catch
    disp('Error al calcular los divisores');
end_try_catch

