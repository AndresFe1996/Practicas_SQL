/* ALTERAR , BORRAR Y  RENOMBRAR UNA TABLA
ALTER TABLE: el comando alter table permite realizar modificaciones sobre una tabla SQL YA CREADA. el comando nos permite
borrar, alterar, agregar columnas a una tabla existente, considere el siguiente ejemplo:

supongamos que tenemos una tabla llamada People, la cual contiene las siguientes columans,
ID, firstname, lastmname y city

ahora queremos agregarle una columna de nombre DateoBirth, el procedimiento es el siguiente

ALTER TABLE People ADD DateofBird date;

el resultado sera una tabla people con todas sus columnas anteriores y ahora con una tabla DateofBirth, 

SUPERIMPORTANTE: las columnas agregadas por defecto tienen valores null

Hagamos un ejemplo real, agreguemos a la tabla Users, una columna con el nombre dateofcreation_user
*/

SELECT * FROM dbo.Users

ALTER TABLE Users ADD dateofcreation_user date;

SELECT * FROM dbo.Users 

/* hemos agregado una columna nueva a nuestra tabla*/

------------------------------------------------------------------------------------------------------------------
/* BORRADO
el siguiente codigo borra la columna dateofcreation_user de la tabla User. tengamos mucho cuidado con el comando DROP, ya que
la eliminacion de una columna conlleva a la perdida de informacion completa de esa columna
*/

ALTER TABLE Users DROP COLUMN dateofcreation_user;
SELECT * FROM dbo.Users

/* Hemos borrado una columna con el comando DROP COLUMN
para elminar una tabla completa solo hacemos lo siguiente

DROP TABLE Users  Recodar que la eliminacion de una tabla supondra la perdida de informacion de esa tabla
*/
------------------------------------------------------------------------------------------------------------------
/* RENOMBRADO
el comando alter table es usado para renombrar columnas, solo necesitamos un comando adicional TO


ALTER TABLE Users RENAME city TO city_users
SELECT * FROM dbo.Users

para renombrar la tabla usamos 

RENAME TABLE Users TO Name_Users

en management studio es mas sencillo, si tenemos permisos de administrador es simplemente llegar y renombrar las columnas que queramos
y las tablas, pero solo el administrador lo va poder hacer

VALIDAR YA QUE UNA COSA ES HACERLO EN TRANSAC SQL Y OTRA EN SQL MANAGEMENT STUDIO

*/



