/* OPERACIONES DE FECHA, HORA Y DURACIONES
Los valores de fecha y hora se pueden aumentar, disminuir y restar. Estas operaciones pueden incluir n�meros decimales
llamados duraciones.

DURACIONES:
Una duraci�n es un n�mero que representa un intervalo de tiempo.

labeled duration:
Una unidad de tiempo espec�fica expresada por un n�mero (que puede ser el resultado de una expresi�n) seguido de una de las
siete palabras clave de duraci�n: YEARS, MONTHS, DAYS, HOURS, MINUTES, SECONDS o MICROSECONDS. (Tambi�n se acepta la forma 
singular de estas palabras clave: YEAR, MONTH, DAY, HOUR, MINUTE, SECOND y MICROSECOND.) El n�mero especificado se convierte 
como si se asignara a un n�mero DECIMAL(15,0), excepto en el caso de SECONDS, que utiliza DECIMAL(27,12) para permitir que 
se incluyan de 0 a 12 d�gitos de segundos fraccionarios. S�lo puede utilizarse una duraci�n etiquetada como operando de un 
operador aritm�tico en el que el otro operando sea un valor de tipo de datos DATE, TIME o TIMESTAMP. As� pues, la expresi�n
HIREDATE + 2 MONTHS + 14 DAYS es v�lida, mientras que la expresi�n HIREDATE + (2 MONTHS + 14 DAYS) no lo es. En ambas
expresiones, las duraciones etiquetadas son 2 MONTHS (meses) y 14 DAYS (d�as).

date duration
Un n�mero de a�os, meses y d�as, expresados como un n�mero DECIMAL(8,0). Para que se interprete correctamente, el 
n�mero debe tener el formato aaaammdd., donde aaaa representa el n�mero de a�os, mm el n�mero de meses y dd el 
n�mero de d�as. (El punto en el formato indica un tipo de datos DECIMAL.) El resultado de restar un valor de fecha de 
otro, como sucede en la expresi�n HIREDATE - BRTHDATE, es una duraci�n de fecha.

time duration:
Un n�mero de horas, minutos y segundos, expresado como un n�mero DECIMAL(6,0). Para que se interprete correctamente, 
el n�mero debe tener el formato hhmmss., donde hh representa el n�mero de horas, mm el n�mero de minutos y ss el n�mero
de segundos. (El punto en el formato indica un tipo de datos DECIMAL.) El resultado de restar un valor de hora de otro
es una duraci�n de hora.

timestamp duration
Un n�mero de a�os, meses, d�as, horas, minutos, segundos y fracciones de segundo, expresado como
un n�mero DECIMAL(14+s,s), donde s es el n�mero de d�gitos de las fracciones de segundo en un rango
de 0 a 12. Para que se interprete correctamente, el n�mero debe tener el formato aaaammddhhmmss.nnnnnnnnnnnn, 
donde aaaa, mm, dd, hh, mm, ss y nnnnnnnnnnnn representan, respectivamente, el n�mero del a�o, mes, d�a, horas, minutos, 
segundos y segundos fraccionarios. El resultado de restar un valor de indicaci�n de fecha y hora de otra es la duraci�n 
de indicaci�n de fecha y hora, con una escala que coincide con la m�xima precisi�n de la indicaci�n de fecha y hora de 
sus operandos.

--ARITMETICA DE FECHA Y HORA EN SQL
Las �nicas operaciones aritm�ticas que pueden efectuarse con valores de fecha y hora son la suma y la resta. Si 
un valor de fecha y hora es un operando de suma, el otro operando debe ser una duraci�n. A continuaci�n, encontrar� 
las normas espec�ficas que rigen la utilizaci�n del operador de suma con valores de fecha y hora.
Si un operando es una fecha, el otro operando debe ser una duraci�n de fecha o una duraci�n etiquetada de YEARS, MONTHS o DAYS.
Si un operando es una hora, el otro operando debe ser una duraci�n de hora o una duraci�n etiquetada de HOURS, MINUTES o SECONDS.
Si un operando es una fecha y hora, el otro operando debe ser una duraci�n. Cualquier tipo de duraci�n es v�lido.
Ning�n operando del operador de suma puede ser un marcador de par�metro.


Las normas para la utilizaci�n del operador de resta con valores de fecha y hora no son las mismas que para la suma, 
porque un valor de fecha y hora no puede restarse de una duraci�n, y porque la operaci�n de restar dos valores de fecha y
hora no es la misma que la operaci�n de restar una duraci�n de un valor de fecha y hora. A continuaci�n se muestran las 
normas espec�ficas que rigen la utilizaci�n del operador de resta con valores de fecha y hora.
Si el primer operando es una indicaci�n de fecha y hora, el segundo operando habr� de ser una fecha, una indicaci�n de fecha
y hora, una representaci�n de serie de una fecha, una representaci�n de serie de una indicaci�n de fecha y hora o una duraci�n. Si el segundo operando es una representaci�n en forma de serie de caracteres de una indicaci�n de fecha y hora, se convierte impl�citamente en una indicaci�n de fecha y hora con la misma precisi�n del primer operando.
Si el segundo operando es una indicaci�n de fecha y hora, el primer operando debe ser una fecha, una indicaci�n de fecha
y hora, una representaci�n en forma de serie de caracteres de una fecha o una representaci�n en forma de serie de caracteres de una indicaci�n de fecha y hora. Si el primer operando es una representaci�n en forma de serie de caracteres de una indicaci�n de fecha y hora, se convierte impl�citamente en una indicaci�n de fecha y hora con la misma precisi�n del segundo operando.
El primer operando es una fecha, el segundo operando debe ser una fecha, una duraci�n de fecha, una representaci�n de una
fecha en forma de serie o una duraci�n etiquetada de YEARS, MONTHS o DAYS.
Si el segundo operando es una fecha, el primer operando debe ser una fecha o una representaci�n de una fecha en forma de 
serie.
Si el primer operando es una hora, el segundo operando debe ser una hora, una duraci�n de hora, una representaci�n de
una hora en forma de serie o una duraci�n etiquetada de HOURS, MINUTES o SECONDS.
Si el segundo operando es una hora, el primer operando debe ser una hora o una representaci�n de una hora en forma de serie.
Ning�n operando del operador de resta puede ser un marcador de par�metro.

ARITMETICA DE LA FECHA ejemplos:*/

--establecemos 2 variables de fecha para operar 
declare @fecha_1 datetime set @fecha_1= '2023-05-14';


declare @fecha_2 datetime set @fecha_2= '2025-01-15';
-- restar fecha 2 de fecha 1 nos devolvera una fecha
print(@fecha_2-@fecha_1) --fecha 2 es mas grande que fecha 1
print(@fecha_1-@fecha_2) -- fecha 1 es mas peque�o que fecha 2 
--ambas operaciones nos dan valores diferentes la ultima es un valor negativo en decimal pero convertido a fecha

/* si sumamos fechas a una fecha negativa, esta cambiara agregando dias a la fecha y por tanto
la fecha se acercara al presente. Inversamente, la fecha viajara al pasado*/
declare @date_negative datetime set @date_negative= @fecha_1-@fecha_2
print(@date_negative)

declare @new_date datetime set @new_date=@date_negative+3000;
print(@new_date)

--podemos agregar unidades de tiempo especificas usando day, year, month 
/* no olvidar que estamos hablando de unidades decimales, donde cada unidad de fecha tiene su equivalencia en fecha*/
declare @function_date_day datetime set @function_date_day=@date_negative+DAY(1000);
print(@function_date_day)
/* agregamos meses, pero vamos a ver que la fecha no cambia mucho, esto sucede porque la fecha es negativa, por tanto
el valor decimal cambia conforme se agrega mas digitos decimales */
declare @function_date_month datetime set @function_date_month=@date_negative+MONTH(8);
print(@function_date_month)

DECLARE @date_positive DATETIME SET @date_positive= (@fecha_2-@fecha_1)+YEAR(20)
print(@date_positive)
/* las fechas se pueden restar. aumentar o disminuir*/

-- DATEDIFF (la funcion debe de ejecutarse con los declare) los argumentos son, tipo de fecha a mostrar, valor inicial y valor final
-- es una manera mas facil de realizar calculo sobre fechas ya ahorrar lineas de codigo
SELECT DATEDIFF(DAY,@fecha_1,@fecha_2);

