/* EXPRESION CASE
Las expresiones CASE permiten seleccionar una expresión en función de la evaluación de una o varias condiciones.

La CASEexpresión pasa por las condiciones y devuelve un valor cuando se cumple la primera 
condición (como una declaración if-then-else). Entonces, una vez que una condición es verdadera, dejará de
leer y devolverá el resultado. Si ninguna condición es verdadera, devuelve el valor de la ELSE cláusula.

Si no hay ELSEparte y ninguna condición es verdadera, devuelve NULL.

sintaxis:

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
Veamos el siguiente ejemplo
*/

-- tenemos la base de datos northwind del detalle de pedidos

SELECT TOP(100) * FROM [Order Details]

/* El siguiente SQL pasa por las condiciones y devuelve un valor cuando se cumple la primera condición: */

SELECT OrderID, Quantity, -- seleccionamos las columans a utilizar
CASE -- colocamos la declaracion case (casos en español)
	WHEN Quantity > 30 THEN 'la cantidad es mas grande que 30' --cuando (WHEN) quantity sea mayor a 30 Entonces(THEN) texto...
	WHEN Quantity =30 THEN 'la cantidad es igual a 30'
	ELSE 'la cantidad es menor a 30' -- si no, texto
END AS QuantityText --finalizar como Quantitytext (columna)
FROM [Order Details] -- de la tabla Order details

/* El siguiente SQL ordenará los clientes por ciudad. Sin embargo, si la ciudad es NULL, ordene por país:*/
SELECT TOP(100) * FROM [Customers]

SELECT CompanyName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);