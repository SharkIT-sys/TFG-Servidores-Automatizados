#!/bin/bash
# Script para comprobar y reiniciar el servicio BIND9 automáticamente en caso de fallo

# Comprobar si BIND9 está activo
if ! systemctl is-active --quiet bind9; then
    echo "BIND9 no está activo. Reiniciando..."
    sudo systemctl restart bind9
    if systemctl is-active --quiet bind9; then
        echo "BIND9 se ha reiniciado correctamente."
    else
        echo "Error al reiniciar BIND9."
    fi
else
    echo "BIND9 está funcionando correctamente."
fi
