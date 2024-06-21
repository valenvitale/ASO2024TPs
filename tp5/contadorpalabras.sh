#!/bin/bash
# CONTADOR DE PALABRAS: escribe un script que lea un archivo de texto y cuente el numero de palabras,
# lineas y caracteres en el archivo.

echo "Ingrese un archivo de texto."
read <archivo>

if [ $# -eq 0]; then
    echo Ningun archivo ingresado
fi

if [ $# -eq 1]; then
