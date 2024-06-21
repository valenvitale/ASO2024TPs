#!/bin/bash

API_KEY="5625fcbfa4a34b4ca82221524242106"

CIUDAD="$1"

# verificamos si la ciudad fue ingresada
if [ -z "$CIUDAD" ]; then
    echo "Uso: $0 <ciudad>"
    exit 1
fi

# URL de la API para el clima actual
URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${CIUDAD}"

RESPONSE=$(curl -s "${URL}")

# verificamos si se solicitó correctamente
if [ $? -ne 0 ]; then
    echo "Error al obtener datos del clima."
    exit 1
fi

# datos que consideramos relevantes
NOMBRE_CIUDAD=$(echo "${RESPONSE}" | jq -r '.location.name')
PAIS=$(echo "${RESPONSE}" | jq -r '.location.country')
TEMP_C=$(echo "${RESPONSE}" | jq -r '.current.temp_c')
CONDICION=$(echo "${RESPONSE}" | jq -r '.current.condition.text')

# verificamos si los datos son validos
if [ -z "$NOMBRE_CIUDAD" ]; then
    echo "Error: No se pudieron obtener datos de clima para la ciudad proporcionada."
    echo "Las ciudades con mas de una palabra deberan ser ingresadas con guion bajo en lugar de espacio."
    exit 1
fi

# imprimir los datos
echo "Ciudad: ${NOMBRE_CIUDAD}"
echo "País: ${PAIS}"
echo "Temperatura: ${TEMP_C}°C"
echo "Condición: ${CONDICION}"