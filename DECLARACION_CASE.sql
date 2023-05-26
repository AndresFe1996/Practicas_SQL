/* EXPRESION CASE
Las expresiones CASE permiten seleccionar una expresi�n en funci�n de la evaluaci�n de una o varias condiciones.

La CASEexpresi�n pasa por las condiciones y devuelve un valor cuando se cumple la primera 
condici�n (como una declaraci�n if-then-else). Entonces, una vez que una condici�n es verdadera, dejar� de
leer y devolver� el resultado. Si ninguna condici�n es verdadera, devuelve el valor de la ELSE cl�usula.

Si no hay ELSEparte y ninguna condici�n es verdadera, devuelve NULL.

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

/* El siguiente SQL pasa por las condiciones y devuelve un valor cuando se cumple la primera condici�n: */

SELECT OrderID, Quantity, -- seleccionamos las columans a utilizar
CASE -- colocamos la declaracion case (casos en espa�ol)
	WHEN Quantity > 30 THEN 'la cantidad es mas grande que 30' --cuando (WHEN) quantity sea mayor a 30 Entonces(THEN) texto...
	WHEN Quantity =30 THEN 'la cantidad es igual a 30'
	ELSE 'la cantidad es menor a 30' -- si no, texto
END AS QuantityText --finalizar como Quantitytext (columna)
FROM [Order Details] -- de la tabla Order details

/* El siguiente SQL ordenar� los clientes por ciudad. Sin embargo, si la ciudad es NULL, ordene por pa�s:*/
SELECT TOP(100) * FROM [Customers]

SELECT CompanyName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);