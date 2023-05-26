/* ACTUALIZANDO DATOS 
La declaracion UPDATE nos permite alterar los dato en una tabla, la sintaxis basica de una consulta UPDATE con una clausula
WHERE es como sigue:
UPDATE table_name
SET Column1=value1, column2=value2, ...
WHERE condition

IMPORTANTE: si omitimos la clausula where TODOS LOS REGISTROS DE LA TABLA SERAN CAMBIADOS */

/* consideremos el siguiente ejemplo de la tabla employees:
supongamos que el nombre de ana beltran quedo mal, no es ana si no lucia, entonces debemos hacer lo siguiente*/
*/
UPDATE Employees
SET FirstName='Lucia'
WHERE EmployeeID=33;
/* ya tenemos modificado el valor, revisemos como esta la tabla ahora*/

SELECT * FROM Employees
/* tambien es posible realizar modificacion de multiples columnas, de la siguiente forma: */
UPDATE Employees
SET FirstName='Lucia',Title='Sales Representative', TitleOfCourtesy='Ms.'
WHERE EmployeeID=33;

SELECT * FROM Employees
/* como vemos, hemos actualizado las columnas title, titleog courstesy.

/* BORRADO DE DATA:
la declaracion DELETE es utilizada para eliminar datos de tu tabla. Las consultas DELETE funcionan muy parecidas a las
consultas UPDATE

DELETE FROM table_name
WHERE condition
IMPORTANTE: si omitimos la declaracion WHERE, TODOS LOS REGSITROS DE LA TABLA SERAN ELIMINADOS, POR FAVOR TENER MUCHO CUIDADO

*/*/
DELETE FROM Employees
WHERE EmployeeID=33;

SELECT * FROM Employees