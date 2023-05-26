/* VISTAS EN SQL
En SQL las vistas son tablas virtuales, creadas para usuarios finales que se basan en una consulta resultante en SQL
una vista contiene filas y columnas al igual que una tabla rea. Los campos en una vista son campos de una o mas tablas reales en
la base de datos

Las vistas nos permiten:

1. estructurar los datos de una forma que los usuarios o clases de usuario encuentren natural para su observacion y consumo
2. restringir el acceso a los datos de tal manera que un usuario puede ver y algunas veces modificar  lo que necesita y no mas
3.resumir datos de varias tablas y utilizarlos para generar reportes

para crear una vista en lenguaje SQL usamos la siguiente sintaxis

CREATE VIEW view_name AS
SELECT Column_name(S)
FROM table_name
WHERE condition;

debemos entender que una vista se compone de joins, de muchos select y de muchas tablas ademas de condiciones, por tanto
la elaboracion es un poco compleja.

el siguiente ejemplo, muestra la creacion de una vista llamada sales_by_category.

create view [dbo].[Sales by Category] AS
SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 
	Sum("Order Details Extended".ExtendedPrice) AS ProductSales
FROM 	Categories INNER JOIN 
		(Products INNER JOIN 
			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 
		ON Products.ProductID = "Order Details Extended".ProductID) 
	ON Categories.CategoryID = Products.CategoryID
WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
--ORDER BY Products.ProductName
GO

un poco larga y compleja, pero una ves creada, la vista sera totalmente funcional, se actualizara con los nuevos registros 
que se hagan y los enviara para revisarse en la vista.
*/
-----------------------------------------------------------------------------------------------------------

/* ACTUALIZAR UNA VISTA
podemos actualizar una lista siguiendo la siguiente sintaxis

CREATE OR REPLACE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition;

podemos eliminar una vista con el comando DROP

DROP VIEW view_name

en ocasiones es mas facil quitar una tabla que modificarla
*/
