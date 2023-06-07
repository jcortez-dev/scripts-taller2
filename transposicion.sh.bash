#!/bin/bash

archivo_entrada=$1
archivo_salida=$2

transponer_caracteres() {
    while IFS= read -r linea; do
        palabras=($linea)

        palabras_invertidas=()
        for (( i=${#palabras[@]}-1; i>=0; i-- )); do
            palabras_invertidas+=("${palabras[i]}")
        done

        linea_invertida=$(IFS=" " ; echo "${palabras_invertidas[*]}")

        echo "$linea_invertida" >> "$archivo_salida"
    done < "$archivo_entrada"
}

transponer_caracteres "$archivo_entrada" "$archivo_salida"
echo "La transposición de caracteres se ha completado correctamente."