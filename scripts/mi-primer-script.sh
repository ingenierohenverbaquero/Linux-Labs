#!/bin/bash

for usuario in usuario1 usuario2 usuario3; do
if id "$usuario" &>/dev/null; then
echo "EL usuario $usuario ya existe, omitiendo..."
else
sudo useradd -m $usuario
echo "$usuario:12345678" | sudo chpasswd
echo "Usario $usuario creado con contraseña"
fi
done
