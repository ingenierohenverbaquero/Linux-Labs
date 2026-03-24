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
