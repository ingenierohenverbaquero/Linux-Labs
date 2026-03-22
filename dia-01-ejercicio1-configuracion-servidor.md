# Día 1 - Ejercicios practicados

## Ejercicio 1 - Configuración de servidor para 3 empleados
Escenario: una empresa tiene 3 empleados nuevos y hay que configurar el servidor.

### 1. Crear los 3 usuarios con su carpeta personal:
sudo useradd -m henver1
sudo useradd -m henver2
sudo useradd -m henver3

### 2. Asignar contraseña a cada usuario:
sudo passwd henver1
sudo passwd henver2
sudo passwd henver3

### 3. Crear estructura de carpetas para cada usuario:
sudo mkdir /home/henver1/documentos /home/henver1/proyectos /home/henver1/backups
sudo mkdir /home/henver2/documentos /home/henver2/proyectos /home/henver2/backups
sudo mkdir /home/henver3/documentos /home/henver3/proyectos /home/henver3/backups

### 4. Asignar permisos a cada carpeta:
sudo chmod 740 /home/henver1/documentos
sudo chmod 750 /home/henver1/proyectos
sudo chmod 700 /home/henver1/backups
sudo chmod 740 /home/henver2/documentos
sudo chmod 750 /home/henver2/proyectos
sudo chmod 700 /home/henver2/backups
sudo chmod 740 /home/henver3/documentos
sudo chmod 750 /home/henver3/proyectos
sudo chmod 700 /home/henver3/backups

### 5. Crear archivo info.txt en cada documentos/:
echo "Servidor configurado por vboxuser" | sudo tee /home/henver1/documentos/info.txt
echo "Servidor configurado por vboxuser" | sudo tee /home/henver2/documentos/info.txt
echo "Servidor configurado por vboxuser" | sudo tee /home/henver3/documentos/info.txt

### 6. Asignar dueño correcto a cada archivo:
sudo chown henver1:henver1 /home/henver1/documentos/info.txt
sudo chown henver2:henver2 /home/henver2/documentos/info.txt
sudo chown henver3:henver3 /home/henver3/documentos/info.txt

### 7. Verificar que todo quedó correcto:
sudo ls -la /home/henver1/documentos/
sudo ls -la /home/henver2/documentos/
sudo ls -la /home/henver3/documentos/

### 8. Revisar que quedó registrado en auth.log:
sudo tail /var/log/auth.log
