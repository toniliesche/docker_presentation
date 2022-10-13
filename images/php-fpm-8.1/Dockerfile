FROM php:8.1-fpm-alpine
LABEL org.opencontainers.image.authors="docker@toniliesche.de"

RUN apk add --no-cache \
 ghostscript \
 imagemagick

RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    freetype-dev \
    icu-dev \
    imagemagick-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev && \
 docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp && \
 docker-php-ext-install -j "$(nproc)" bcmath \
    exif \
    gd \
    intl \
    mysqli \
    zip && \
 mkdir -p /tmp/pear && \
 cd /tmp/pear && \
 pecl bundle imagick-3.6.0 && \
 docker-php-ext-install /tmp/pear/imagick && \
 # some wordpress image voodoo - see official Dockerfile for explanation https://github.com/docker-library/wordpress/blob/b9af6087524edc719249f590940b34ef107c95ca/latest/php7.4/fpm-alpine/Dockerfile
 out="$(php -r 'exit(0);')"; \
	[ -z "$out" ]; \
	err="$(php -r 'exit(0);' 3>&1 1>&2 2>&3)"; \
	[ -z "$err" ]; \
	\
	extDir="$(php -r 'echo ini_get("extension_dir");')"; \
	[ -d "$extDir" ]; \
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive "$extDir" \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
 apk add --no-network --virtual .wordpress-phpexts-rundeps $runDeps && \
 apk del --no-network .build-deps && \
 rm -Rf /tmp/pear
