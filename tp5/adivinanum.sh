#!/bin/bash
# Adivina el numero: escribe un script que genere uun numero aleatorio entre 1 y 100
# |y permita al usuario intentar adivinarlo, proporcionando pistas si el intento es demasiado alto o bajo.

num=$(($RANDOM % 100 + 1))
echo "Adivine un numero entre 1 y 100"

while true; do
    echo Ingrese un numero:
    read numIng

    if ["$numIng" -eq "$num"]; then
        echo "El numero es correcto."
        break
    elif ["$numIng" -lt "num"]; then
        echo "El numero a adivinar es mayor que el ingresado."
    elif ["$numIng" -gt "num"]; then
        echo "El numero a adivinar es menor que el ingresado."
    fi
done