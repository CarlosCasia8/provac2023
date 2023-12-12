import psycopg2
from tabulate import tabulate

opcion = 0
print("Calculadora IVA")

while opcion != 3:
    print("Ingrese una opción: \n 1. ingresar la cantidad \n 2. historial \n 3. salir")
    opcion = input("Su elección: ").upper()

    if opcion == '1': 
        try:
            conexion =psycopg2.connect(
            host = "localhost",
            port = "5432",
            user = "postgres",
            password = "darker",
            dbname = "postgres"
                )
            cursor = conexion.cursor()
            precio = float(input("Ingresar el precio en Q: "))
            IVA=precio*0.12;
            precio_sin_iva=precio - IVA;
            print(f"El precio sin IVA es de Q{precio_sin_iva:.0f}, por lo tanto el IVA es de Q{IVA:.0f}")
            sql = 'insert into iva(precio, precio_sin_iva, valor_del_IVA) values(%s,%s,%s)'
            datos=(precio, precio_sin_iva, IVA);
            cursor.execute(sql, datos)
            conexion.commit()
            
        except psycopg2.Error as e:
                  print("Error en la conexión. \n")
        finally:
            # Cerrar el cursor y la conexión
            cursor.close()
            conexion.close()
    elif opcion == '2':
        try:
            conexion =psycopg2.connect(
            host = "localhost",
            port = "5432",
            user = "postgres",
            password = "darker",
            dbname = "postgres")
            cursor = conexion.cursor()
            cursor.execute('select *from iva')
            print(tabulate(cursor, headers=["Precio","Precio_sin_iva","Valor_del_iva"], tablefmt="psql", numalign="center"))
            conexion.commit()
        except psycopg2.Error as e:
                  print("Error en la conexión. \n")
        finally:
            # Cerrar el cursor y la conexión
            #cursor.close()
            conexion.close()
    elif opcion == '3':
        break
    else:
        print("Opción no válida, reintentar.")