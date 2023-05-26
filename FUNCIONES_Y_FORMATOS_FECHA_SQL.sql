/* MANEJO DE FECHAS EN SQL
Tipos de datos para fecha y hora
Tenemos los siguientes tipos de datos de fecha y hora de conversión de SQL en SQL Server.

Tipo de dato

Formato

Time

hh:mm:ss[.nnnnnnn]

Date

YYYY-MM-DD

SmallDateTime

YYYY-MM-DD hh:mm:ss

DateTime

YYYY-MM-DD hh:mm:ss[.nnn]

DateTime2

YYYY-MM-DD hh:mm:ss[.nnnnnnn]

DateTimeOffset

YYYY-MM-DD hh:mm:ss[.nnnnnnn] [+|-]hh:mm

En SQL Server, nosotros hemos utilizado funciones integradas como SQL GETDATE() y GetUTCDate() para poder proporcionar 
la fecha y el formato del servidor en varios formatos.

SYSDATETIME(): para devolver la fecha y hora del servidor
SYSDATETIMEOffset(): va a devolver la fecha y hora del servidor, junto con el desplazamiento UTC
GETUTCDATE(): va a devolver la fecha y la hora GMT (hora media de Greenwich)
GETDATE(): va a devolver la fecha y hora del servidor

*/
--devolver la fecha y hora del servidor--
SELECT SYSDATETIME() AS SysDateTime;
SELECT SYSDATETIMEOffset() AS SysDateTime;
SELECT GETUTCDATE() AS SysDateTime;
SELECT GETDATE() AS sysdatetime;

/* FORMATO DE FECHA CONVERSION EN SQL
Como se mencionó anteriormente, es muy probable que necesitemos formatear una fecha en diferentes formatos según nuestros
requisitos. Podemos tratar de usar la función CONVERT() en SQL Server para poder formatear DateTime en varios formatos.

La sintaxis para la función SQL : CONVERT() es la siguiente.

SELECT CONVERT (data_type(length)),Date, DateFormatCode)

Data_Type: necesitamos poder definir el tipo de dato junto con la longitud. En la función de fecha, vamos a utilizar los
tipos de datos Varchar (longitud)

Fecha: necesitamos poder especificar la fecha que queremos convertir
DateFormatCode: necesitamos especificar el DateFormatCode para poder convertir una fecha en un formulario apropiado. 
Exploraremos más sobre este tema en la próxima sección

Exploremos varios formatos de fecha usando las funciones de conversión de fecha SQL.

Primero, vamos a declarar una variable para mantener la fecha y hora actual usando la función SQL GETDATE() con la 
siguiente consulta.
*/
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Print @Existingdate

/*Podemos apreciar varios formatos de fecha en la siguiente tabla. Puede mantener esta tabla a mano para fines
de referencia en el formato de columnas de fecha y hora. */

--FORMATO MM/DD/YY STANDAR USA
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,1) as [MM/DD/YY]

--FORMATO YY.MM.DD STANDAR ANSI
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,2) as [YY.MM.DD]

-- FORMATO DD/MM/YY STANDAR BRITISH/ FRANCE
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,3) as [DD/MM/YY]

--FORMATO DD.MM.YY STANDAR GERMANY
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,4) as [DD.MM.YY]

--FORMATO DD-MM-YY STANDAR ITALIAN
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,5) as [DD-MM-YY]

--FORMATO DD MMM YY STANDAR Shortened month name
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,6) as [DD MMM YY]

--FORMATO MMM DD, YY Shortened month name
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,7) as [MMM DD,YY]

--FORMATO HH:MM:SS STARNDAR 24 HRS
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,8) as [hh:mm:ss]

--FORMATO MMM DD YYYY hh:mm:ss:mmm(AM/PM)
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,9) as [MMM DD YYYY hh:mm:ss:mmm(AM/PM)]

-- FORMATO MM-DD-YY STANDAR USA
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,10) as [MM-DD-YY]

-- FORMATO YY/MM/DD STANDAR JAPAN
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,11) as [YY/MM/DD]

-- FORMATO YYMMDD STANDAR ISO
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,12) as [YYMMDD]

-- FORMATO DD MMM YYYY HH:MM:SS:MMM STANDAR EUROPEAN DEFAULT + MILLISECONDS
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,13) as [DD MMM YYYY HH:MM:SS:MMM]

-- FORMATO HH:MM:SS:MMM STANDAR 24 HORAS CON MILISEGUNDOS
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,14) as [HH:MM:SS:MMM]

-- FORMATO YYYY-MM-DD HH:MM:SS.mmm standar ODBC canonical with milliseconds
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,21) as [YYYY-MM-DD HH:MM:SS.mmm]

-- EXISTEN MUCHOS MAS FORMATOS DE HORAS, PODEMOS CONSULTARLOS AQUI 
/*https://www.sqlshack.com/es/funciones-y-formatos-de-sql-convert-date */

/* en la siguiente tabla podemos ver varios codigos de formatos sql con sus requisitos:

Opciones de formato de fecha

Salida SQL de la función convert

***************************************

0

Dec 30 2006 12:38AM

1

12/30/06

2

06.12.30

3

30/12/2006

4

30.12.06

5

30/12/2006

6

30-Dec-06

7

Dec 30, 06

8

00:38:54

9

Dec 30 2006 12:38:54:840AM

10

12-30-06

11

06/12/1930

12

61230

13

30 Dec 2006 00:38:54:840

14

00:38:54:840

20

30/12/2006 00:38

21

38:54.8

22

12/30/06 12:38:54 AM

23

30/12/2006

24

00:38:54

25

38:54.8

26

2006-30-12 00:38:54.840

27

12-30-2006 00:38:54.840

28

12-2006-30 00:38:54.840

29

38:54.8

30

30-2006-12 00:38:54.840

31

2006-30-12

32

12-30-2006

33

12-2006-30

34

30/12/2006

35

30-2006-12

100

Dec 30 2006 12:38AM

101

12/30/2006

102

2006.12.30

103

30/12/2006

104

30.12.2006

105

30/12/2006

106

30-Dec-06

107

Dec 30, 2006

108

00:38:54

109

Dec 30 2006 12:38:54:840AM

110

12-30-2006

111

30/12/2006

112

20061230

113

30 Dec 2006 00:38:54:840

114

00:38:54:840

120

30/12/2006 00:38

121

38:54.8

126

2006-12-30T00:38:54.840

127

2006-12-30T00:38:54.840

130

10 ?? ????? 1427 12:38:54:840A

131

10/12/1427 12:38:54:840AM

*/

/* DATEADD

Podemos usar la función SQL DATEADD para poder agregar un período particular a nuestra fecha. Vamos a suponer que tenemos 
el requisito de agregar 1 mes a la fecha actual. Podemos usar la función SQL DATEADD para poder realizar esta tarea.

La sintaxis para la función SQL DATEADD es la siguiente

DATEADD(interval, number, date)
Intervalo: con esto podemos especificar un intervalo que debe agregarse en la fecha especificada. Donde 
podemos tener valores como año, trimestre, mes, día, semana, hora, minuto, etc.

Número: este especifica el número del intervalo para poder agregar. Como por ejemplo, si hemos especificado el 
intervalo como el Mes y Número como el 2, significa que se deben agregar 2 meses en la fecha.

En la siguiente consulta, queremos agregar 2 meses en la fecha actual.

*/

SELECT GETDATE() as Currentdate
 
SELECT DATEADD(month, 2, GETDATE()) AS NewDate;

---Del mismo modo, vamos agregar 1 año a la fecha actual utilizando la siguiente consulta.

select GETDATE() as Currentdate
 
SELECT DATEADD(Year, 1, GETDATE()) AS NewDate;
 

 /*
 Podemos combinar las funciones SQL DATEADD y CONVERT para poder obtener resultados en los formatos DateTime deseados. 
 Y supongamos en el ejemplo anterior; que queremos un formato de fecha en MMM DD, YYYY. Podemos tratar de usar el código
 de formato 107 para poder obtener resultados en este formato.

Puede ejecutar el siguiente código para obtener Newdate y ConvertedDate.
*/
SELECT 
 DATEADD(YEAR,1,GETDATE()) AS [NewDate]
 ,CONVERT(varchar(110),DATEADD(YEAR,1,GETDATE()),107) AS [ConvertedDate]