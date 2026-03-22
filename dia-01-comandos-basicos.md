# Día 1 - Comandos básicos de Linux

## Navegación

- pwd → muestra la ruta completa de la carpeta donde estás parado actualmente

- ls → lista los archivos y carpetas del directorio actual
  - -l → muestra la lista en formato largo (permisos, dueño, tamaño, fecha)
  - -a → muestra todos los archivos incluyendo los ocultos (los que empiezan con punto)
  - -la → combina los dos anteriores

- cd → navega entre carpetas
  - cd /ruta → va a una carpeta específica del sistema
  - cd ~ → va directo a tu carpeta personal sin importar dónde estés

## Archivos

- touch → crea un archivo vacío
  - Ejemplo: touch archivo.txt

- echo → imprime texto en la terminal
  - echo "texto" > archivo → escribe en un archivo (si ya tiene contenido lo reemplaza)
  - echo "texto" >> archivo → agrega texto al final sin borrar lo que ya hay
  - echo "texto" | sudo tee archivo → escribe en archivos que requieren permisos de root
    (el > normal no funciona con sudo, por eso se usa tee)

- cat → muestra el contenido completo de un archivo
  - Ejemplo: cat archivo.txt

- cp → copia un archivo
  - Ejemplo: cp origen.txt destino.txt

- mv → mueve o renombra un archivo
  - mv archivo.txt carpeta/ → mueve el archivo a otra carpeta
  - mv archivo.txt nuevo-nombre.txt → renombra el archivo

- rm → elimina un archivo de forma permanente (no hay papelera en Linux)
  - Ejemplo: rm archivo.txt

## Permisos

Los permisos se dividen en 3 grupos de 3 caracteres: dueño / grupo / otros
Cada grupo puede tener: r (leer=4), w (escribir=2), x (ejecutar=1)
Se suman para obtener el número: rwx=7, rw-=6, r-x=5, r--=4, ---=0

- chmod → cambia los permisos de un archivo o carpeta
  - chmod 700 archivo → rwx------ (solo el dueño puede todo, nadie más nada)
  - chmod 740 archivo → rwxr----- (dueño todo, grupo solo leer, otros nada)
  - chmod 750 archivo → rwxr-x--- (dueño todo, grupo leer y ejecutar, otros nada)
  - chmod 755 archivo → rwxr-xr-x (dueño todo, grupo y otros pueden leer y ejecutar)

- chown → cambia el dueño y grupo de un archivo
  - chown usuario archivo → cambia solo el dueño
  - chown usuario:grupo archivo → cambia dueño y grupo al mismo tiempo

## Usuarios

- useradd → crea un usuario en el sistema
  - -m → crea automáticamente su carpeta personal en /home
  - Ejemplo: useradd -m juan (crea el usuario juan con carpeta /home/juan)

- passwd → gestiona contraseñas
  - passwd → cambia tu propia contraseña (no necesita sudo)
  - sudo passwd usuario → cambia la contraseña de otro usuario (necesita sudo)

- userdel → elimina un usuario del sistema
  - -r → elimina también su carpeta personal en /home
  - Ejemplo: userdel -r juan (sin -r la carpeta queda huérfana en el sistema)

## Servicios

- systemctl → gestiona los servicios del sistema
  - systemctl start servicio → enciende el servicio
  - systemctl stop servicio → apaga el servicio
  - systemctl restart servicio → apaga y vuelve a encender (útil al cambiar configuración)
  - systemctl status servicio → muestra si está activo, desde cuándo y sus últimos logs

## Logs

Los logs del sistema viven en /var/log/ y registran todo lo que ocurre en el servidor

- tail → muestra las últimas líneas de un archivo de log
  - tail archivo → muestra las últimas 10 líneas por defecto
  - tail -n 20 archivo → muestra las últimas 20 líneas (puedes cambiar el número)
  - tail -f archivo → monitorea el archivo en tiempo real, muestra cada línea nueva al instante
  - Ejemplo: tail -f /var/log/auth.log

- Logs importantes:
  - /var/log/auth.log → registra logins, uso de sudo e intentos fallidos de contraseña
  - /var/log/syslog → log general del sistema
  - /var/log/apache2/access.log → cada visita al servidor web
  - /var/log/apache2/error.log → errores del servidor web
