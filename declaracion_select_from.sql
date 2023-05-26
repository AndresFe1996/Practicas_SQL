*/ DECLARACIONES EN SQL
LA DECLARACION "SELECT": "SELECT" PERMITE SELECCIONAR LAS COLUMNAS QUE QUEREMOS DE UNA TABLA EN UNA BASE DE DATOS*/
*/ la declaracion select siempre va acompañada de un "FROM" lo que quiere decir "De" basicamente queremos selecionar una columna
de un tabla*/

SELECT * FROM dbo.Categories

SELECT TOP(10) * FROM [Categories]

*/ podemos realizar multiples consultas usando ;
*/ recuerda colocar el ; para indicarle a SQL que la consulta esta lista y completa para la ejecucion */
SELECT CategoryName FROM dbo.Categories;
SELECT Description FROM dbo.Categories;

*/ SQL es insensible a mayusculas o minusculas, por tanto la siguiente expresion*/

select top(100) * FROM [Categories]
*/ es totalmente valida*/


*/ SQL es insensible a espacios vacios, en este caso esta consulta tambien la va ba a ejecutar*/

SELECT TOP(10)             *                  FROM                dbo.Categories

*/ aunque se recomiendo evitar este tipo de consultas ya que podrian generar errores mas adelante*/

*/ podemos seleccionar multiples columnas, solo basta conocer el nombre y separarlas con copa en el select

SELECT EmployeeID,LastName,FirstName,BirthDate from Employees

*/ podemos seleccionar todas las columans, para eso usamos *  */

select * from Employees

*/ LAS PALABRAS CLAVE DISTINCT Y LIMIT, a veces en la tabla que estamos consultando se pueden presentar registros multiples
o informacion que se repite varias veces o queremos que nos retorne solo cierto numero de registros que cumpplen una condicion, 
esto lo hacemos con DISTINC y LIMIT. DISTINCT, ELIMINA EN LA CONSULTA TODOS LOS REGISTROS DUPLICADOS Y LIMIT, RETORNA SOLO UNA CANTIDAD
DE RESULTADOS QUE QUEREMOS REVISAR*/

SELECT DISTINCT CategoryName FROM  Categories */ en este caso nos retorna solo los elementos unicos de una tabla con registros
repetidos */

SELECT * FROM Categories LIMIT 3;

*/ ORDENAR ELEMENTOS CLASIFICADOS CON ORDER BY*/
*/ la declaracion de abajo se conoce como nombres clasificados y la expresion es totalmente equivalente a esta
SELECT [Order Details].Quantity, [Order Details].UnitPrice FROM [Order Details]

SELECT Quantity,UnitPrice FROM [Order Details]

*/ para organizar un conjunto de elementos usamos order by

SELECT Quantity,UnitPrice FROM [Order Details]
ORDER BY Quantity, UnitPrice ASC; */ la palabra clave ASC es ascendente de menor a mayor


SELECT Quantity,UnitPrice FROM [Order Details]
ORDER BY Quantity, UnitPrice DESC;    */ la palabra clave DESC es decendente de mayor a menor*/

