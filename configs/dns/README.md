# Carpeta de configuración de BIND9 (DNS)

## Archivos incluidos:
- `db.casio.local`: Zona de resolución directa.
- `db.192`: Zona de resolución inversa.
- `named.conf.options`: Configuración global y forwarders.

### Ejemplo de Zona Directa (db.casio.local):
```text
$TTL 604800
@ IN SOA dns.casio.local. root.casio.local. (
  20250306 ; Serial
  604800   ; Refresh
  86400    ; Retry
  2419200  ; Expire
  604800 ) ; Negative Cache TTL

@    IN NS dns.casio.local.
dns  IN A  192.168.1.111
dhcp IN A  192.168.1.112
web  IN A  192.168.1.114
```
