#!/bin/bash
# Script de inicialización - Ejecutar una sola vez antes del primer docker-compose up

echo "🚀 Inicializando configuraciones..."

# Crear directorios
mkdir -p data/nginx
mkdir -p data/php
mkdir -p data/logs

# Copiar templates si no existen
if [ ! -f "data/nginx/default.conf" ]; then
    echo "📄 Copiando template de nginx..."
    cp data/nginx/default.conf.template data/nginx/default.conf
    echo "✅ data/nginx/default.conf creado"
fi

if [ ! -f "data/php/www.conf" ]; then
    echo "📄 Copiando template de php-fpm..."
    cp data/php/www.conf.template data/php/www.conf
    echo "✅ data/php/www.conf creado"
fi

if [ ! -f "data/php/php.ini" ]; then
    echo "📄 Copiando template de php.ini..."
    cp data/php/php.ini.template data/php/php.ini
    echo "✅ data/php/php.ini creado"
fi

echo ""
echo "✨ Listo! Ahora puedes ejecutar:"
echo "   docker-compose up -d --build"
echo ""
echo "📁 Configuraciones disponibles en ./data/ para personalizar"
