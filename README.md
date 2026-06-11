# Nginx + PHP-FPM Docker Stack

Stack simple con Nginx y PHP-FPM usando Alpine.

## 🚀 Uso Rápido

### 1. Inicializar configuraciones (solo una vez)
```bash
./setup.sh
```

### 2. Iniciar servicios
```bash
docker-compose up -d --build
```

### 3. Ver logs
```bash
docker-compose logs -f
```

## 📁 Estructura

```
.
├── docker-compose.yaml          # Orquestación
├── php.Dockerfile              # PHP-FPM con extensiones
├── setup.sh                    # Script de inicialización
├── app/                        # Tu código PHP (montar aquí)
└── data/
    ├── nginx/
    │   └── default.conf        # Configuración de Nginx
    ├── php/
    │   └── php.ini             # Configuración de PHP
    └── logs/                   # Logs de ambos servicios
        ├── nginx/
        │   ├── nginx-access.log
        │   └── nginx-error.log
        └── php/
            ├── php-error.log
            ├── php-fpm-access.log
            ├── php-fpm-error.log
            └── php-fpm-slow.log
```

## 📋 Archivos de Logs

Todos los logs se guardan en subdirectorios separados:

### Nginx
- `data/logs/nginx/nginx-access.log` - Accesos HTTP
- `data/logs/nginx/nginx-error.log` - Errores de Nginx

### PHP
- `data/logs/php/php-error.log` - Errores de PHP

### PHP-FPM
- `data/logs/php/php-fpm-access.log` - Accesos a PHP-FPM
- `data/logs/php/php-fpm-error.log` - Errores de PHP-FPM
- `data/logs/php/php-fpm-slow.log` - Requests lentos (slow log)

## ⚙️ Configuración

### Cambiar versión de PHP
```bash
PHP_VERSION=8.2 docker-compose up -d --build
```

### Personalizar configuraciones
Edita los archivos en `data/`:
- `data/nginx/default.conf` - Virtual host de Nginx
- `data/php/php.ini` - Configuración de PHP

### Reiniciar después de cambios
```bash
docker-compose restart nginx
docker-compose restart php
```

## 🐛 Troubleshooting

Si los contenedores no inician porque faltan configuraciones:
```bash
./setup.sh  # Crea las configuraciones desde templates
docker-compose up -d
```

## 📦 Extensiones PHP Instaladas

- curl
- gd (con freetype/jpeg)
- mbstring
- pgsql
- xml
- xsl
- zip
- pdo_pgsql
- exif
- fileinfo
