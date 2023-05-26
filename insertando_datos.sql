/* INSERTANDO DATOS EN SQL
las tablas de SQL almacenan datos en filas, una fila tras otra. La declaracion INSERT INTO es utilizada para añadir nuevas filas
de datos a una tabla en una base de datos.

la sintaxis de INSERT INTO es la siguiente:

INSERT INTO table_name
VALUES (values1, value2, Value3,...,ValueN);

Donde valuesN se refuere a la N cantidad de columnas que tiene la tabla donde vamos a insertar, asi, si tenemos 3 columnas
INSERT INTO permitira registrar 1 fila con 3 valores, si tenemos una tabla de 100 columnas entonces tendremos una fila con 100
elementos y asi sucesivamente.

consideremos la tabla Employees
*/
SELECT * FROM Employees
------------------------------------------------------------------------------------------------------------------------
/*Muestra cantidad de columna de una tabla*/
SELECT Table_Name, COUNT(*) As NumeroCampos
FROM Information_Schema.Columns
WHERE Table_Name = 'Employees'
GROUP BY Table_Name;

/* Muestra las tablas y sus cantidades de campos incluye las vistas de la base de datos*/
SELECT Table_Name, COUNT(*) As NumeroCampos
FROM Information_Schema.Columns
GROUP BY Table_Name
ORDER BY Table_Name

--------------------------------------------------------------------------------------------------------------------------------
/* Consideremosque vamos a agregar un nuevo empleado, por tanto usemos la declaracion INSERT INTO para agregarlo, con la consulta
inicial tenemos 18 campos que llenar, vamos a llenar solo 2*/

INSERT INTO Employees (FirstName,LastName)
VALUES ('Ana','Beltran')

SELECT * FROM Employees
/* como vemos se acaba de actualizar la tabla con el nombre ana beltral

----------------------------------------------------------------------------------------------------------------------------------


