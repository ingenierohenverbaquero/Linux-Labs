#!/bin/bash
# Script para crear usuarios automáticamente
# Autor: Henver Baquero
# Fecha: 23/03/2026

for usuario in usuario1 usuario2 usuario3; do
    if id "$usuario" &>/dev/null; then
        echo "El usuario $usuario ya existe, omitiendo..."
    else
        sudo useradd -m $usuario
        echo "$usuario:12345678" | sudo chpasswd
        echo "Usuario $usuario creado con contraseña"
    fi
done
