--TABLAS SQL--
/* CREANDO UNA TABLA:
una sola base de datos de SQL puede albergar cientos de tablas, las tablas se conforman de filas y columnas junto con sus datos
los cuales figuran tipos de datos diferentes de acuerdo a la necesidad de la operacion.

la declaracion CREATE TABLE permite crear tablas en una base de datos sql con sus correspondientes columnas y tipos
de datos a almacenar

crear una tabla implica crear los tipos de datos de cada columna

la sintaxis de la creacion de una tabla es la siguiente

CREATE TABLE Table_name
(column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
......
column_n data_type(size)
);

donde column_name especifica los nombres que tendran cada columna, data_type contiene el tipo de dato
que almacenara esa columna en esa tabla en especifico y size es el tamaño de longitud maxima de la columna
por ejemplo un tipo de dato int es un tipo entero y almacenara numeros enteros, ejemplos de numeros enteros pueden ser ID, unidades
, cantidades, dias del mes, etc
*/

/* Asumamos que queremos construir una tabla con los nombres de usuarios de un sistema, entonces*/

CREATE TABLE Users
(
	UserID int,
	Firstname varchar(100),
	lastname varchar (100),
	city varchar (100)
);

/* VARCHAR es el tipo de datos para almacenar texto, el 100 especifica la cantidad de caracteres de texto que tendra para 
colocar en ese renglon y en esta columna en especifica, es decir, 100 indica que tenemos espacio para 100 letras*/

---------------------------------------------------------------------------
/* CLAVE PRIMARIA: se define como el identificador unico de una fila de datos dentro de nuestra tabla, la primary key
es unica. Podemos definirla en la creacion de una tabla de la siguiente forma:*/

CREATE TABLE Users
(
	UserID int,
	Firstname varchar(100),
	lastname varchar (100),
	city varchar (100),
	PRIMARY KEY(UserID)
);

/*especifica el nombre de la columna en los parentesis de la sentencia PRIMARY KEY*/

/* podemos seleccionar nuestra tabla y veremos una tabla vacia*/

SELECT * FROM Users

/* practiquemos un poco, agregemos algunos datos a nuestra tabla*/

INSERT INTO Users
VALUES 
(1,'juan david','carranza peres','Bogota'),
(2,'pedro manual','jaramillo ','Medellin'),
(3,'cesar ','perez gutierrez','Caracas'),
(4,'cesar david','torres suarez','Mexico DF')

SELECT * FROM Users

/* el id 2 quedo mal el nombre, corrijelo*/

UPDATE Users
SET Firstname='pedro manuel'
WHERE UserID=2

SELECT * FROM Users