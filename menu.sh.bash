#!/bin/bash

mostrar_menu() {
    clear
    echo "MENU DE OPCIONES"
    echo "1. GPG - Cifrado Simétrico"
    echo "2. GPG - Cifrado Asimétrico"
    echo "3. GPG - Firma Digital"
    echo "4. Script de Sustitución"
    echo "5. Script de Transposición"
    echo "6. Salir"
}

ejecutar_opcion() {
    case $1 in
        1)
            echo "Has seleccionado GPG - Cifrado Simétrico"
            read -p "Ingresa el nombre del archivo a cifrar: " archivo
            if [ -f $archivo ]; then
                gpg --symmetric $archivo
                echo "El archivo ha sido cifrado de forma simétrica."
            else
                echo "El archivo $archivo no existe."
            fi
            ;;
        2)
            echo "Has seleccionado GPG - Cifrado Asimétrico"
            read -p "Ingresa el nombre del archivo a cifrar: " archivo
            if [ -f $archivo ]; then
                read -p "Ingresa la clave pública: " clave_publica
                gpg --encrypt --recipient $clave_publica $archivo
                echo "El archivo ha sido cifrado de forma asimétrica."
            else
                echo "El archivo $archivo no existe."
            fi
            ;;
        3)
            echo "Has seleccionado GPG - Firma Digital"
            read -p "Ingresa el nombre del archivo a firmar: " archivo
            if [ -f $archivo ]; then
                read -p "Ingresa el nombre del archivo de salida con la firma: " archivo_firmado
                gpg --output $archivo_firmado --sign $archivo
                echo "El archivo ha sido firmado digitalmente."
            else
                echo "El archivo $archivo no existe."
            fi
            ;;
        4)
            echo "Has seleccionado Script de Sustitución"
            read -p "Ingresa el nombre del archivo de entrada: " archivo_entrada
            read -p "Ingresa el nombre del archivo de salida: " archivo_salida

       
            if [ -f "$archivo_entrada" ]; then
                ./sustitucion.sh "$archivo_entrada" "$archivo_salida"
                echo "La sustitución de caracteres se ha completado correctamente."
            else
                echo "El archivo de entrada '$archivo_entrada' no existe."
            fi
            ;;
        5)
            echo "Has seleccionado Script de Transposición"
            read -p "Ingresa el nombre del archivo de entrada: " archivo_entrada
            if [ -f $archivo_entrada ]; then
                read -p "Ingresa el nombre del archivo de salida: " archivo_salida
                # Coloca aquí el comando para ejecutar el script de transposición
                ./transposicion.sh $archivo_entrada $archivo_salida
                echo "El archivo ha sido procesado con el script de transposición."
            else
                echo "El archivo $archivo_entrada no existe."
            fi
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, selecciona una opción válida."
            ;;
    esac
}

while true; do
    mostrar_menu
    read -p "Ingresa el número de opción: " opcion
    ejecutar_opcion $opcion
    read -p "Presiona Enter para continuar..."
done
