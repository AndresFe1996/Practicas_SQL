/*FILTRADO FUNCIONES Y CONSULTAS*/
/* LA DECLARACION WHERE: se usa para extraer solo esos registros que cumplen una condicion, por ejemplo*/
USE Northwind
SELECT * FROM [Order Details]
WHERE ProductID=11
/* aqui filtramos las ordenes con id de productos numero 11

 OPERADORES LOGICOS DE SQL son utilizados por where para evaluar la condicion tenemos los siguientes
= igual, != no igual > mayor, < menor, >= mayor o igual , <= menor o igual y BETWEEN dentro de un rango especifico
*/

-- BETWEEN, es un operador de intervalo, necesita envaluar un rango entonces el ranog inicial siempre sera menor al final*/

SELECT * FROM [Order Details]
WHERE ProductID BETWEEN 11 AND 20

-- cuando manejemos texto siempre usemos '' para referirnos a el*/

SELECT * FROM Employees
WHERE Title='Sales Representative'

----------------------------------------------------------------------------------------------------------------------------
-- OPERADORES LOGICOS AND Y OR */

-- and es el operador y evalua si son condiciones verdaderas devolvera el resultado, si no, no devolvera nada
-- or es un operador o y evalua si al menos una condiciones es valida */

SELECT * FROM Suppliers
where City='London' AND Country='UK'

SELECT * FROM Suppliers
where City='London' OR Country='UK'

--DECLARACIONES IN Y NOT IN* SE USAN PARA DEFINIR Y UN ELMENTO DENTRO DE UN CONJUNTO SE CONTIENE O NO SE CONTIENE*/

SELECT * FROM Suppliers
where City IN ('London','Berlin') 


SELECT * FROM Suppliers
where City NOT IN ('London','Berlin') 

-- COLUMNAS PERSONALIZADAS, la funcion concat se usa para unir 2 columnas* y AS nos permite colocar un apodo o sobrenombre/

SELECT * FROM Employees
SELECT CONCAT(FirstName,'',LastName) AS nombre_empleado FROM Employees 

-- OPERADORES ARITMETICOS, sql maneja las operaciones suma + resta - division / y multiplicacion la operacion se aplica
-- a toda la columna*/

SELECT UnitPrice, UnitPrice*0.5 AS Descuento FROM [Order Details]

-- FUNCIONES EN SQL*/

/* UPPER convierte todas las letras minisculas de una columna de texto en mayusculas
LOWER convierte todas las letras mayusculas de una columna de texto a minuscula */

SELECT FirstName, upper(LastName) FROM Employees
SELECT lower(FirstName), LastName FROM Employees

-- SQRT Y avg: sqrt es la raiz cuadrada y avg es un promedio

SELECT SQRT(UnitPrice) FROM [Order Details]
SELECT AVG(UnitPrice) FROM [Order Details]

-- SUM: es usada para calcular la suma total */
SELECT SUM(UnitPrice) FROM [Order Details]

--SUBCONSULTAS SE DEFINEN COMO SUBCONSULTAS A AQUELLA PARTE DE CODIGO QUE ES UNA CONSULTA DENTRO DE OTRA CONSULTA

SELECT Quantity FROM [Order Details]
WHERE Quantity> ( SELECT AVG(Quantity) FROM [Order Details])
--------------------------------------------------------------------------------------------------------------
--LIKE Y MIN --
/* LIKE: la palabra clave like es util cuando especificar una condicion de busqueda dentro de la clausula where
el emparejado de patrones en SQL te permite utilizar "_" para coincidir con cualquier caracter unico y "%" para coincidir con un numero arbitrario
de caracteres (incluyendo ningun caracter) por ejemplo para seleccionar empleados de la tabla employees
cuyos registros en la columna FirstName comiencen con la letra A usamos la siguiente sintaxis*/

SELECT FirstName,LastName
FROM Employees 
WHERE FirstName LIKE 'A%'
 
/* por otro lado, si queremos buscar lo que termine con la letra A enntonces cambiamos la sintaxis de esta forma*/
SELECT FirstName,LastName
FROM Employees 
WHERE FirstName LIKE '%A'

/* el % puede ser usando varias veces dentro del mismo patron asi:*/

SELECT FirstName,LastName
FROM Employees 
WHERE FirstName LIKE '%Andrew%'

/* MIN ES UNA DECLARACION QUE SIRVE PARA RETORNAR EL VALOR MINIMO SE USA DESPUES DE UNA declaracion select*/

SELECT MIN(Quantity) FROM [Order Details]


---------------------------------------------------------------------------------
/* RECUERDA:
1. seleccionar con * o con el nombre de las columnas a trabajar en nuestra consulta
2. sql es un lenguaje que no tiene problemas con las mayusculas, minusculas o espacios en blanco eso si
lo recomendable es que las sentencias sean en MAYUSCULUAS y la instruccion siga un orden adecuado
3. las subconsultas son operaciones en las cuales mendiante un select inicial podemos establecer con where una condicion
donde se evalue otra consulta dentro de la misma, RECUERDA QUE SIEMPRE SE USA EN UN WHERE
4. las funciones MIN, AVG, SUM, SQRT son las funciones de minimo, promedio,suma y raiz cuadrada
5. LIKE es una sentencia de busqueda de texto, recuerda usar en el patron % donde la letra inicial indica buscar una coincidencia 
de texto que inicie, una letra al final es una coincidencia de texto donde termine y %% se usa para buscar una palabra clave,
por ejemplo %andres% %auto% etc
6. AND Y OR son operadores de y o condicionales, sirven para colocarlas en una consulta como condiciones en un where
7. usamos AS para crear una columna personalizada dentro de nuestra consulta
8. CONCAT sirve para concatenar columnas, siempre va despues de un select
9. upper sirve para declarar una columna de texto con solo mayusculas y lower sirve para declarar minusculas
10. NOT IN e IN sirve para declarar un conjunto de valores que cumplen una condicion en un where, IN es contiene y NOT IN NO CONTIENE
