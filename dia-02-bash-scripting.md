# Día 2 - Bash Scripting

## ¿Qué es un script?
Un script es un archivo de texto con una serie de comandos que se ejecutan 
automáticamente en orden. En vez de escribir 10 comandos uno por uno, los 
pones en un archivo y los ejecutas todos con un solo comando.

Todo script de Bash debe empezar con:
#!/bin/bash
Esta línea le dice al sistema que use Bash para interpretar el archivo.

Para ejecutar un script primero hay que darle permisos de ejecución:
chmod +x script.sh
Luego ejecutarlo con:
./script.sh

## Variables
Una variable guarda un valor para usarlo después.

Reglas importantes:
- Al definir una variable NO lleva $ → nombre="Henver"
- Al usar una variable SÍ lleva $ → echo "$nombre"
- Sin espacios al definirla → nombre="Henver" (correcto) / nombre = "Henver" (error)

Ejemplos:
nombre="Henver"
edad=20
echo "Hola, me llamo $nombre y tengo $edad años"

## Read - recibir input del usuario
read espera que el usuario escriba algo y lo guarda en una variable.

Ejemplo:
echo "¿Cuál es tu nombre?"
read nombre
echo "Hola $nombre"

## Guardar resultado de un comando en una variable
Con $() puedes ejecutar un comando y guardar su resultado en una variable.

Ejemplo:
fecha=$(date +%Y-%m-%d)
echo "Hoy es $fecha"

date +%Y-%m-%d → genera la fecha en formato año-mes-día. Ejemplo: 2026-03-23

## Condicionales
Permiten que el script tome decisiones según una condición.

Estructura:
if [ condición ]; then
    comandos si se cumple
else
    comandos si no se cumple
fi

Operadores de comparación numérica:
- -ge → mayor o igual que
- -gt → mayor que
- -le → menor o igual que
- -lt → menor que
- -eq → igual que
- -ne → diferente que

Ejemplo:
echo "¿Cuántos años tienes?"
read edad

if [ $edad -ge 18 ]; then
    echo "Eres mayor de edad"
else
    echo "Eres menor de edad"
fi

## Verificar si un usuario existe
id "$usuario" &>/dev/null verifica si un usuario existe en el sistema.
- Si existe → éxito → entra al then
- Si no existe → error → salta al else
- &>/dev/null descarta los mensajes de salida, solo nos interesa si existe o no

Ejemplo:
if id "$usuario" &>/dev/null; then
    echo "El usuario $usuario ya existe"
else
    echo "El usuario $usuario no existe"
fi

## Loops
Permiten repetir acciones automáticamente sin escribir el mismo código varias veces.

Estructura:
for variable in lista; do
    comandos
done

En cada vuelta la variable toma el siguiente valor de la lista.

Ejemplo con lista manual:
for usuario in juan maria pedro; do
    echo "Procesando $usuario"
done

Ejemplo con rango numérico:
for i in {1..10}; do
    echo "Número: $i"
done

## chpasswd - asignar contraseñas automáticamente
passwd normal no sirve en scripts porque pide input manual.
chpasswd asigna contraseñas automáticamente sin pedir input.

Formato: echo "usuario:contraseña" | sudo chpasswd

Ejemplo:
echo "juan:12345678" | sudo chpasswd

## Script completo - crear usuarios automáticamente
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

Comportamiento:
- Si el usuario ya existe → lo omite sin error
- Si no existe → lo crea y le asigna contraseña
- Esto hace el script robusto — no falla si algo ya está hecho

## Script completo - backup automático con fecha
#!/bin/bash
# Script de backup automático
# Autor: Henver Baquero
# Fecha: 23/03/2026

fecha=$(date +%Y-%m-%d)
origen="/home/vboxuser/documentos-importantes"
destino="/home/vboxuser/backups"

mkdir -p $destino
cp -r $origen $destino/backup-$fecha

echo "Backup completado: $destino/backup-$fecha"

Comandos nuevos usados:
- mkdir -p → crea la carpeta y si ya existe no da error
- cp -r → copia una carpeta completa con todo su contenido
- Cada día crea un backup diferente con la fecha en el nombre
