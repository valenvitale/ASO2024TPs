#!/bin/bash
#   7) Mostrar el género de un nombre ingresado por el usuario, usando la API del sitio
#      https://api.genderize.io/?name=nombre.

if [ -z "$1" ]; then
    echo "Uso: $0 <nombre>"
    exit 1
fi

nombre="$1"
url="https://api.genderize.io/?name=${nombre}"
respuesta=$(curl -s "${url}")

if [ $? -ne 0 ]; then
    echo "Error al obtener datos del género."
    exit 1
fi

nombre_deApi=$(echo "${respuesta}" | jq -r '.name')
genero=$(echo "${respuesta}" | jq -r '.gender')
probabilidad=$(echo "${respuesta}" | jq -r '.probability')

if [ -z "$genero" ]; then
    echo "No se pudo determinar el género para el nombre: ${nombre}"
    exit 1
fi

echo "Nombre: ${nombre_deApi}"
echo "Género: ${genero}"
echo "Probabilidad: ${probabilidad}"