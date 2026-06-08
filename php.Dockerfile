ARG PHP_VERSION="8.3"

FROM php:${PHP_VERSION}-fpm-alpine

# Instalar dependencias necesarias para compilar extensiones
RUN apk add --no-cache \
    pcre2-dev \
    curl-dev \
    zlib-dev \
    libpng-dev \
    oniguruma-dev \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    freetype-dev \
    jpeg-dev \
    libjpeg-turbo-dev \
    bash \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
    curl \
    gd \
    mbstring \
    pgsql \
    xml \
    xsl \
    zip \
    pdo_pgsql \
    exif \
    fileinfo \
    && docker-php-ext-enable \
    curl \
    gd \
    mbstring \
    pgsql \
    xml \
    xsl \
    zip \
    pdo_pgsql \
    exif \
    fileinfo \
    && rm -rf /var/cache/apk/* /var/lib/apk/*

# Crear directorio de trabajo
RUN mkdir -p /var/www/html && \
    chmod -R 750 /var/www/html && \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# Usar entrypoint por defecto de php-fpm
