#!/bin/bash
# Script: backup_dhcpd.sh refactorizado

# Cargar configuración centralizada
source "$(dirname "$0")/../configs/settings.conf"

# Definir la ruta de origen y destino usando las variables
ORIGEN="/etc/dhcp/dhcpd.conf"
DESTINO="$BACKUP_DIR"
FECHA=$(date +%F)

# Crear el directorio de backup si no existe
mkdir -p "$DESTINO"

# Realizar la copia de seguridad
cp "$ORIGEN" "$DESTINO/dhcpd.conf.$FECHA"

# Eliminar copias antiguas usando la variable de retención
find "$DESTINO" -type f -name "dhcpd.conf.*" -mtime +"$RETENTION_DAYS" -exec rm {} \;

echo "$(date): Copia de seguridad realizada en $DESTINO" >> /var/log/backup_dhcpd.log
