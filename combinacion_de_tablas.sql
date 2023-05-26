/* COMBINACION DE TABLAS, LOS JOINS DE SQL*/
/* hasta el mommento todas las consultas de SQl que hemos realizado se basan en una sola tabla, sin embargo,
SQL es mas poderoso que eso pues es capaz de unir varias tablas y formar una tabla nueva temporalmente que une ambos mediante una
primary key y una foreight key a esto se le conoce como los join, podemos unir tablas tambien usando la sentencia where
como sigue acontinuacion*/

/* se desea unir las ordenes con los detalles, como product id, unitprice, quantity y discount*/
SELECT * FROM dbo.Orders
SELECT * FROM [Order Details]

SELECT dbo.Orders.OrderID,
dbo.Orders.EmployeeID,
dbo.[Order Details].UnitPrice,
dbo.[Order Details].Quantity,
dbo.[Order Details].Discount
FROM dbo.Orders, dbo.[Order Details]
WHERE dbo.Orders.OrderID=dbo.[Order Details].OrderID

/* tambien podemos colocar apodos a las tablas para que nos quede mucho mas corto el codigo sql esto lo hacemos con nombres
personalizados */
SELECT ord.OrderID,
ord.EmployeeID,
or_d.UnitPrice,
or_d.Quantity,
or_d.Discount
FROM dbo.Orders AS ord, dbo.[Order Details] AS or_d
WHERE ord.OrderID=or_d.OrderID 

/* colocando los apodos, la consulta se hace mucho mas pequeña, aunque siga siendo un poco larga*/
-------------------------------------------------------------------------------------------------------------

/* TIPOS DE COMBINACIONES: los siguientes son los tipos de combinaciones que pueden ser utilziados en Mysql
INNER JOIN
LEFT JOIN
RIGHT JOIN

INNER JOIN= Es el quivalente a join retorna las filas cuando hay una coincidencia entre las tablas, la grafica
de este inner join es el intercepto de 2 conjuntos de datos
*/

SELECT orders.OrderID, [Order Details].UnitPrice FROM Orders
INNER JOIN [Order Details]
ON orders.OrderID=[Order Details].OrderID

/* solo va retornar las coincidencias */

/* LEFT JOIN: es una combinacion que retorna todas las filas de la tabla izquierda asi no haya coincidencias en la tabla derecha
esto significa que si no no hay una coincidencia para la clausula ON en la tabla de la derecha aun asi la combinacin retornara las filas de la primera tabla
como resultado*/

SELECT orders.OrderID, [Order Details].UnitPrice FROM Orders
LEFT OUTER JOIN [Order Details]  /* la palabra clave OUTER es opcional y hace referencia a un join diferente a inner, en este caso
outer funciona para full, left y right*/
ON orders.OrderID=[Order Details].OrderID;

/* la diferencia aqui es que con left join si los datos de la tabla de la izquierda no existen en la derecha, el resultado sera
un valor null para las filas de la derecha*/

/* RIGHT JOIN: la combinacion right join retorna todas las filas de la tabla derecha, asi no haya coincidencias en la tabla
izquierda la sintaxis basica es la siguiente: */

SELECT * FROM Orders
RIGHT OUTER JOIN [Order Details] 
ON orders.OrderID=[Order Details].OrderID;
/* la tabla orders es la tabla base, por lo que la tabla order details sera la que se adjunte en la derecha
por lo que las columnas de order details se coloca en la derecha*/

----------------------------------------------------------------------------------------------------------------------
/* OPERACIONES DE AGRUPACION
ocasionalmente, puedes necesitar combinar datos de multiples tablas en un conjunto de datos exhaustivo. Esto puede ser
para tablas con datos similares dentro de la misma base de datos o quizas hay una necesidad de combinar datos similares
a traves de bases de datos o incluso a traves de servidores.

para lograr esto se usa UNION Y UNION ALL

UNION: combina varios conjuntos de datos en un solo conjunto de datos y remueve cualquier duplicado
UNION ALL: combina varios conjuntos de datos en un solo conjunto de datos, pero no remueve filas duplicadas

UNION es mas rapido que UNION ALL en temrinos de consumo de recursos, ya que no elimina los posibles duplicados*/

/* LA SINTAXIS DE UNION ES MUY SENCILLA , pero solot tenemos varias reglas
1. todas las declaraciones select deben tener el mismo  tipo de datos
2. todas las columnas en cada declaracion select deben estar en el mismo orden*/

SELECT * FROM Employees
	
SELECT * FROM [Order Details]
-------------------------------------------------------------
/* SINTAXIS*/
SELECT EmployeeID FROM Employees
UNION
SELECT EmployeeID FROM EmployeeTerritories
/* como podemos ver, los duplicados fueron eliminados y la tabla quedo 2 columnas una de employeed y otra de employees territori
CONSEJO: si en caso tal tenemos dos tablas con diferente cantidad de columnas podemos hacer un union con NULL
de la siguiente forma: */

SELECT EmployeeID , LastName FROM Employees
UNION
SELECT EmployeeID ,NULL FROM EmployeeTerritories;

/* nos devolvera una tabla pero ahora las columnas donde no se pueda unir saldra valor NULL ahora bien como las columans
no son iguales en ambos select la propiedad de eliminar los valores duplicados se anula*/

---------------------------------------------------------------------------------------------------------------------

/* UNION ALL: une ambas tablas por sus columnas y omite la eliminacion de duplicados  */

SELECT EmployeeID FROM Employees
UNION ALL
SELECT EmployeeID FROM EmployeeTerritories;