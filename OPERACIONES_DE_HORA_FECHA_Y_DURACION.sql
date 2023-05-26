/* OPERACIONES DE FECHA, HORA Y DURACIONES
Los valores de fecha y hora se pueden aumentar, disminuir y restar. Estas operaciones pueden incluir números decimales
llamados duraciones.

DURACIONES:
Una duración es un número que representa un intervalo de tiempo.

labeled duration:
Una unidad de tiempo específica expresada por un número (que puede ser el resultado de una expresión) seguido de una de las
siete palabras clave de duración: YEARS, MONTHS, DAYS, HOURS, MINUTES, SECONDS o MICROSECONDS. (También se acepta la forma 
singular de estas palabras clave: YEAR, MONTH, DAY, HOUR, MINUTE, SECOND y MICROSECOND.) El número especificado se convierte 
como si se asignara a un número DECIMAL(15,0), excepto en el caso de SECONDS, que utiliza DECIMAL(27,12) para permitir que 
se incluyan de 0 a 12 dígitos de segundos fraccionarios. Sólo puede utilizarse una duración etiquetada como operando de un 
operador aritmético en el que el otro operando sea un valor de tipo de datos DATE, TIME o TIMESTAMP. Así pues, la expresión
HIREDATE + 2 MONTHS + 14 DAYS es válida, mientras que la expresión HIREDATE + (2 MONTHS + 14 DAYS) no lo es. En ambas
expresiones, las duraciones etiquetadas son 2 MONTHS (meses) y 14 DAYS (días).

date duration
Un número de años, meses y días, expresados como un número DECIMAL(8,0). Para que se interprete correctamente, el 
número debe tener el formato aaaammdd., donde aaaa representa el número de años, mm el número de meses y dd el 
número de días. (El punto en el formato indica un tipo de datos DECIMAL.) El resultado de restar un valor de fecha de 
otro, como sucede en la expresión HIREDATE - BRTHDATE, es una duración de fecha.

time duration:
Un número de horas, minutos y segundos, expresado como un número DECIMAL(6,0). Para que se interprete correctamente, 
el número debe tener el formato hhmmss., donde hh representa el número de horas, mm el número de minutos y ss el número
de segundos. (El punto en el formato indica un tipo de datos DECIMAL.) El resultado de restar un valor de hora de otro
es una duración de hora.

timestamp duration
Un número de años, meses, días, horas, minutos, segundos y fracciones de segundo, expresado como
un número DECIMAL(14+s,s), donde s es el número de dígitos de las fracciones de segundo en un rango
de 0 a 12. Para que se interprete correctamente, el número debe tener el formato aaaammddhhmmss.nnnnnnnnnnnn, 
donde aaaa, mm, dd, hh, mm, ss y nnnnnnnnnnnn representan, respectivamente, el número del año, mes, día, horas, minutos, 
segundos y segundos fraccionarios. El resultado de restar un valor de indicación de fecha y hora de otra es la duración 
de indicación de fecha y hora, con una escala que coincide con la máxima precisión de la indicación de fecha y hora de 
sus operandos.

--ARITMETICA DE FECHA Y HORA EN SQL
Las únicas operaciones aritméticas que pueden efectuarse con valores de fecha y hora son la suma y la resta. Si 
un valor de fecha y hora es un operando de suma, el otro operando debe ser una duración. A continuación, encontrará 
las normas específicas que rigen la utilización del operador de suma con valores de fecha y hora.
Si un operando es una fecha, el otro operando debe ser una duración de fecha o una duración etiquetada de YEARS, MONTHS o DAYS.
Si un operando es una hora, el otro operando debe ser una duración de hora o una duración etiquetada de HOURS, MINUTES o SECONDS.
Si un operando es una fecha y hora, el otro operando debe ser una duración. Cualquier tipo de duración es válido.
Ningún operando del operador de suma puede ser un marcador de parámetro.


Las normas para la utilización del operador de resta con valores de fecha y hora no son las mismas que para la suma, 
porque un valor de fecha y hora no puede restarse de una duración, y porque la operación de restar dos valores de fecha y
hora no es la misma que la operación de restar una duración de un valor de fecha y hora. A continuación se muestran las 
normas específicas que rigen la utilización del operador de resta con valores de fecha y hora.
Si el primer operando es una indicación de fecha y hora, el segundo operando habrá de ser una fecha, una indicación de fecha
y hora, una representación de serie de una fecha, una representación de serie de una indicación de fecha y hora o una duración. Si el segundo operando es una representación en forma de serie de caracteres de una indicación de fecha y hora, se convierte implícitamente en una indicación de fecha y hora con la misma precisión del primer operando.
Si el segundo operando es una indicación de fecha y hora, el primer operando debe ser una fecha, una indicación de fecha
y hora, una representación en forma de serie de caracteres de una fecha o una representación en forma de serie de caracteres de una indicación de fecha y hora. Si el primer operando es una representación en forma de serie de caracteres de una indicación de fecha y hora, se convierte implícitamente en una indicación de fecha y hora con la misma precisión del segundo operando.
El primer operando es una fecha, el segundo operando debe ser una fecha, una duración de fecha, una representación de una
fecha en forma de serie o una duración etiquetada de YEARS, MONTHS o DAYS.
Si el segundo operando es una fecha, el primer operando debe ser una fecha o una representación de una fecha en forma de 
serie.
Si el primer operando es una hora, el segundo operando debe ser una hora, una duración de hora, una representación de
una hora en forma de serie o una duración etiquetada de HOURS, MINUTES o SECONDS.
Si el segundo operando es una hora, el primer operando debe ser una hora o una representación de una hora en forma de serie.
Ningún operando del operador de resta puede ser un marcador de parámetro.

ARITMETICA DE LA FECHA ejemplos:*/

--establecemos 2 variables de fecha para operar 
declare @fecha_1 datetime set @fecha_1= '2023-05-14';


declare @fecha_2 datetime set @fecha_2= '2025-01-15';
-- restar fecha 2 de fecha 1 nos devolvera una fecha
print(@fecha_2-@fecha_1) --fecha 2 es mas grande que fecha 1
print(@fecha_1-@fecha_2) -- fecha 1 es mas pequeño que fecha 2 
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

