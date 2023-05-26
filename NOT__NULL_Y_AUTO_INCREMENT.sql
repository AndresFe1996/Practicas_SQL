/* NOT NULL Y AUTO_INCREMENT 
RESTRICCIONES EN SQL

las restricciones en sql son utilizadas para especificar reglas para los datos en la tabla

Las siguientes son las restriciones mas comunes

NOT NULL: indica que una columna no puede contener valores nulos
UNIQUE: no permite insertar un valor duplicado en una columna. la restricion unique mantiene la unidad de una columna
en una tabla, se puede utilizar en una tabla mas de un unique

PRIMARY KEY: obliga a la tabla a aceptar datos unicos para una columna especifica y adicional crea un indice unico para
acceder mas rapiamente a la tabla

DEFAULT: mientras se inserta datos en una tabla, si no se suple un valor en una columna, entonces la columna optiene un 
valor fijado como default

por ejemplo la siguiente sintaxis establece un valor no nulo para una columna

name varchar(100) NOT NULL

AUTO INCREMENT:
el incremento automatico permite que un numero unico sea generado cuando un nuevo registro es insertado en una tabla.
usualmente queremos que el valor del campó de clave primaria sea creado automaticamente cada ves que un nuevo de registro es
insertado.

por defecto el valor inicial de autoincrement es 1 y sera incrementado en 1 por cada registro nuevo insertado

por ejemplo, establezcamos el campo userID como auto incremental, entonces:

UserID int NOT NULL AUTO_INCREMENT
PRIMARY KEY (UserID)

vamos a crear una tabla SQL ahora con nuestras restricciones antes vistas

CREATE TABLE User (
ID int NOT NULLL AUTO_INCREMENT
Username varchar(40) NOT NULL,
password varchar(10) NOT NULL,
PRIMARY KEY (Id)
);



*/

