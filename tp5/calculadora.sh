#!/bin/bash
# Calculadora simple: crea un script que funcione como calculadora simple.
# Debe pedir al usuario dos numeros y la operacion que desea utilizar (suma, resta, multiplicacion, division)
# y luego mostrar en el archivo.

echo "          ---Calculadora---"
echo Seleccione la operacion que desea realizar:
echo 1. Sumar
echo 2. Restar
echo 3. Multiplicar
echo 4. Dividir
read op

if [ $op = "1" ]; then
    echo Ingrese el primer numero
    read num1
    echo Ingrese el segundo numero
    read num2
    echo La respuesta es:
    suma= expr $num1 + $num2

elif [ $op = "2" ]; then
    echo Ingrese el primer numero
    read num1
    echo Ingrese el segundo numero
    read num2
    echo La respuesta es:
    resta= expr $num1 - $num2

elif [ $op = "3" ]; then
    echo Ingrese el primer numero
    read num1
    echo Ingrese el segundo numero
    read num2
    echo La respuesta es:
    multiplicacion=$(($num1 * $num2))
    echo $multiplicacion

elif [ $op = "4" ]; then
    echo Ingrese el primer numero
    read num1
    echo Ingrese el segundo numero
    read num2
    
    if [ $num1 -eq "0" -o $num2 -eq "0" ]; then
        echo "Error, no es posible dividir por 0."
        else
        division=$(($num1 / $num2))
        echo "La respuesta es: $division"
    fi
else
    echo "Opcion invalida."

fi