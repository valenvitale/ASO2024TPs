#!/bin/bash
#   8) Mostrar la edad probable de un nombre ingresado por el usuario, usando la API del sitio.
#      https://api.agify.io/?name=nombre.

if [ -z "$1" ]; then
    echo "Uso: $0 <nombre>"
    exit 1
fi

nombre="$1"
url="https://api.agify.io/?name=${nombre}"
respuesta=$(curl -s "${url}")

if [ $? -ne 0 ]; then
    echo "Error al obtener datos de la edad."
    exit 1
fi

nombre_deApi=$(echo "${respuesta}" | jq -r '.name')
edad=$(echo "${respuesta}" | jq -r '.age')

if [ -z "$edad" ]; then
    echo "No se pudo determinar la edad para el nombre: ${nombre}"
    exit 1
fi

echo "Nombre: ${nombre_deApi}"
echo "Edad probable: ${edad}"