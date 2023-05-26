/* TIPOS DE DATOS EN SQL
los tipos de datos especifican el tipo para una columna particular. Si una columna llamada "lasname" va almacenar nombres, 
entonces esa columna en particular debe ser un varchar (caracteres de longitud variable)

----------------------------------
----TIPOS DE DATOS MAS COMUNES----
----------------------------------

--NUMERICOS---

INT: un entero de tamaño normal que puede ser con o sin signo
FLOAT: (m,d) un numero de punto flotante que no puede ser sin signo. Opcionalmente puedes definir la longitud de muestra m
y el numero de decimales d

DOUBLE(m,d) un numero de punto flotante de doble preciiso que no puede ser sin signo. Opcionalmente puede definir la longitud de muestra m
y el numero de decimales d

--FECHA Y HORA--

DATE: una fecha en formato AAAA-MM-DD
DATETIME: una combinacion de fecha y hora en formato AAAA-MM-DD HH:MM:SS
TIMESTAMP una marca de tiempo es calculada desde la media noche del 1 de enero de 1970
TIME: almacena la hora en formato HH:MM:SS

--TIPO STRING--
CHAR(M): cadena de texto de longitud pre-estabelcida. el tamaño es especificado entre parentesis. Maximo 255 bytes
VARCHAR(M) cadena de texto de longitud variable. El tamaño maximo es especificado entre parentesis
BLOB "grandes objetos binarios" y son utilizados para almacenar grandes cantidades de datos binarios, como imagenes u
otros archivos
TEXT grandes cantidades de texto

seleccionar un buen tipo de datos influye en un buen diseño de base de datos



*/