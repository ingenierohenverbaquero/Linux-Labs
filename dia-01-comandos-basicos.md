# Día 1 - Comandos básicos de Linux

## Navegación
- pwd → muestra la ruta de la carpeta actual
- ls → lista archivos y carpetas
- ls -la → lista con permisos, dueño, tamaño y archivos ocultos
- cd /ruta → navegar a una carpeta específica
- cd ~ → ir directo a la carpeta personal

## Archivos
- touch archivo → crear archivo vacío
- echo "texto" > archivo → escribir en archivo (reemplaza contenido)
- echo "texto" >> archivo → agregar al final sin borrar lo que hay
- cat archivo → leer contenido de un archivo
- cp origen destino → copiar archivo
- mv origen destino → mover o renombrar archivo
- rm archivo → eliminar archivo (sin papelera, permanente)
- echo "texto" | sudo tee archivo → escribir en archivo que requiere permisos de root

## Permisos
- chmod 740 archivo → rwxr----- (dueño todo, grupo leer, otros nada)
- chmod 750 archivo → rwxr-x--- (dueño todo, grupo leer y ejecutar, otros nada)
- chmod 700 archivo → rwx------ (solo dueño puede todo, nadie más nada)
- chown usuario:grupo archivo → cambia dueño y grupo del archivo

## Usuarios
- useradd -m usuario → crea usuario y su carpeta personal en /home
- passwd usuario → asigna o cambia contraseña de un usuario
- userdel -r usuario → elimina usuario y su carpeta personal en /home

## Servicios
- systemctl start servicio → enciende el servicio
- systemctl stop servicio → apaga el servicio
- systemctl restart servicio → reinicia el servicio
- systemctl status servicio → muestra estado actual del servicio

## Logs
- tail /var/log/auth.log → muestra las últimas 10 líneas del log
- tail -n 20 /var/log/auth.log → muestra las últimas 20 líneas
- tail -f /var/log/auth.log → monitorea el log en tiempo real
