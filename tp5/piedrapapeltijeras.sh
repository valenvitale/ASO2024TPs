#!/bin/bash
# Piedra, Papel o Tijeras: crea un script para jugar a "Piedraz, Papel o Tijeras" contra la computadora.
# El script debe solicitar la eleccion del usuario, generar una eleccion aleatoria para la computadora
# y determinar el ganador.

echo "Piedra, Papel o Tijeras"
echo "1. Piedra"
echo "2. Papel"
echo "3. Tijeras"

while true; do
    echo "Elija opcion 1, 2 o 3"
    read opcion

    computadora=$(($RANDOM % 3 + 1))
    if [ "$opcion" -eq "$computadora" ]; then
        echo "EMPATE"
        echo "La computadora eligio" $computadora

    elif [ "$opcion" -eq "1" ]; then
        if [ "$computadora" -eq "2" ]; then
            echo "PERDISTE :("
        elif [ "$computadora" -eq "3" ]; then
            echo "GANASTE!!"
        fi
        echo "La computadora eligio" $computadora

    elif [ "$opcion" -eq "2" ]; then
        if [ "$computadora" -eq "1" ]; then
            echo "GANASTE!!"
        elif [ "$computadora" -eq "3" ]; then
            echo "PERDISTE :("
        fi
        echo "La computadora eligio" $computadora
    
    elif [ "$opcion" -eq "3" ]; then
        if [ "$computadora" -eq "1" ]; then
            echo "PERDISTE :("
        elif [ "$computadora"# hacer la solicitud a la API y guardar la respuesta -eq "2" ]; then
            echo "GANASTE!!"
        fi
        echo "La computadora eligio" $computadora
    
    else
        echo "Opción no válida. Por favor, elija entre 1, 2 o 3."
    fi

done
