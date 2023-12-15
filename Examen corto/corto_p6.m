#Examen corto
#Programa mayor a menor

nu1 = input("Ingresar el número de inicio:\n");
nu2 = input("Ingresar el número final:\n");
file = fopen('salida6.txt', 'w');
try
  if nu1 > nu2
     fprintf("El número mayor es: %f  y el menor %f\n", nu1, nu2);

    for num = nu2:1:nu1
      % Muestra el número en la pantalla
        disp(num);
        fprintf(file, "El resultado es: %f\n", num);
    end
             fclose(file);
  elseif nu1 < nu2
     fprintf("El número mayor es: %f  y el menor %f\n", nu2, nu1);
       for num = nu1:1:nu2
        % Muestra el número en la pantalla
        disp(num);
        fprintf(file, "El resultado es: %f\n", num);
    end
             fclose(file);
  else
      fprintf("Los números son iguales. %f, %f\n", nu2, nu1);
  end
catch
   disp('Ocurrio un error.');
end_try_catch
