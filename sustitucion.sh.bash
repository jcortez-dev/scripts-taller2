#!/bin/bash

cifrar_cesar() {
    caracter=$1
    if [[ $caracter =~ [a-zA-Z] ]]; then
        ascii=$(printf "%d" "'$caracter")
        if [[ $ascii -ge 65 && $ascii -le 90 ]]; then
            ascii=$(((ascii - 65 + 6) % 26 + 65))
        elif [[ $ascii -ge 97 && $ascii -le 122 ]]; then
            ascii=$(((ascii - 97 + 6) % 26 + 97))
        fi
        echo -n "$(printf "\\$(printf '%03o' "$ascii")")"
    else
        echo -n "$caracter"
    fi
}

if [ $# -ne 2 ]; then
    echo "Uso: $0 <archivo_entrada> <archivo_salida>"
    exit 1
fi

archivo_entrada=$1
archivo_salida=$2

if [ ! -f "$archivo_entrada" ]; then
    echo "El archivo de entrada $archivo_entrada no existe."
    exit 1
fi

while IFS= read -r -n1 caracter; do
    cifrar_cesar "$caracter" >> "$archivo_salida"
done < "$archivo_entrada"

echo "El cifrado de César se ha completado. El resultado se ha guardado en el archivo $archivo_salida."