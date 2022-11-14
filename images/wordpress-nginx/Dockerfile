ARG wordpress_version
FROM phpughh/wordpress-php:${wordpress_version}

FROM nginx:1.23-alpine

COPY --from=0 --chown=root:root --chmod=755 /var/www/html/wordpress /var/www/html/wordpress