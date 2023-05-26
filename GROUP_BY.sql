/* GROUP BY
La GROUP BYdeclaración agrupa filas que tienen los mismos valores en filas de resumen, como 
"encontrar la cantidad de clientes en cada país".

La GROUP BY declaración se usa a menudo con funciones agregadas ( COUNT(), MAX(), MIN(), SUM(), AVG()) 
para agrupar el conjunto de resultados por una o más columnas.
SINTAXIS:

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

*/
---AGRUPAMOS POR CIUDAD Y POR CONTEO DE CIUDAD
SELECT City, COUNT(*) FROM dbo.Customers
GROUP BY City
-- AGRUPAMOS POR PAIS Y CUENTA LA CANTIDAD DE PAIS
SELECT Country, COUNT(*) AS Cuenta FROM dbo.Customers
GROUP BY Country

SELECT * FROM dbo.Customers

-- AGRUPAMOS POR MAS DE UNA COLUMNA CALCULANDO EL ESCALAR DE CADA COLUMNA

SELECT City, Country, COUNT(*) FROM dbo.Customers
GROUP BY City,Country

-- agrupamos con subtotales usando la funcion rollup

SELECT City, Country, COUNT(*) FROM dbo.Customers
WHERE Country IS NOT NULL
GROUP BY ROLLUP(City,Country)
ORDER BY City, Country DESC
/* lo que sale null es el subtotital por CITY*/

SELECT * FROM [Order Details]

-- AGRUPAR LOS ORDER ID POR SUMA DE UNIDADES PRECIO Y CANTIDADES
SELECT OrderID, SUM(UnitPrice) AS Precio_total, SUM(Quantity) AS Cantidad FROM [Order Details]
GROUP BY OrderID, UnitPrice,Quantity