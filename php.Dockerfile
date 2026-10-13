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

# Configurar logs de PHP-FPM
RUN echo "[global]" > /usr/local/etc/php-fpm.d/docker.conf && \
    echo "error_log = /var/log/php/php-fpm-error.log" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "[www]" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "access.log = /var/log/php/php-fpm-access.log" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "slowlog = /var/log/php/php-fpm-slow.log" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "request_slowlog_timeout = 10s" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "request_slowlog_trace_depth = 20" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "catch_workers_output = yes" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "decorate_workers_output = no" >> /usr/local/etc/php-fpm.d/docker.conf && \
    echo "listen = 0.0.0.0:9000" >> /usr/local/etc/php-fpm.d/www.conf


# Usar entrypoint por defecto de php-fpm
