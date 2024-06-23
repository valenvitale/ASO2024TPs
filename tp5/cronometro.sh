#!/bin/bash
#   5) Cronómetro: Crea un script que actúe como un cronómetro. Debe permitir al
#      usuario iniciar, detener y reiniciar el cronómetro, mostrando el tiempo transcurrido
#      en segundos.

seg=0
andando=false

echo "Presiona [Enter] para iniciar el cronometro."

read -p ""

while true; do
    clear
    echo "                  ---Cronometro---"
    echo "Presiona [Enter] para |detener| o |reanudar| el cronometro"
    echo "              Presiona [r] para reiniciar"
    echo "                Presiona [s] para salir"
    echo
    echo "Tiempo transcurrido: $seg segundos"

    if $andando; then
        ((seg++))
    fi

    read -n 1 -s seleccion

    if [[ $seleccion == "s" ]]; then
        break
    elif [[ $seleccion == "" ]]; then
        andando=!$andando
    elif [[ $seleccion == "r" ]]; then
        seg=0
        andando=false
    fi
done

echo -e "\nCronometro detenido. Tiempo total: $seg segundos"