## Ejercicio 2 - Auditoría de seguridad
Escenario: el jefe de TI sospecha accesos no autorizados y pide revisar y asegurar el servidor.

### 1. Crear usuario auditor con su carpeta personal:
sudo useradd -m auditor

### 2. Asignar contraseña al usuario auditor:
sudo passwd auditor

### 3. Crear carpeta reportes/:
sudo mkdir /home/auditor/reportes

### 4. Asignar permisos a la carpeta reportes/:
sudo chmod 740 /home/auditor/reportes

### 5. Crear archivo auditoria.txt con mensaje:
echo "Auditoria iniciada por vboxuser - fecha: 22/03/2026" | sudo tee /home/auditor/reportes/auditoria.txt

### 6. Asignar dueño correcto al archivo:
sudo chown auditor:auditor /home/auditor/reportes/auditoria.txt

### 7. Corregir permisos del archivo (texto no necesita ejecución):
sudo chmod 640 /home/auditor/reportes/auditoria.txt

### 8. Verificar permisos y dueño:
sudo ls -la /home/auditor/reportes/

### 9. Revisar intentos fallidos en auth.log:
sudo tail /var/log/auth.log
(buscar líneas con "authentication failure" - indican intentos fallidos de contraseña)

### 10. Reiniciar Apache y verificar que quedó activo:
sudo systemctl restart apache2
sudo systemctl status apache2
(debe mostrar "active (running)")
