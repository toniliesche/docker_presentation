FROM phpughh/php-fpm:7.4

RUN apk add --no-cache linux-headers && \
 mkdir -p /tmp/pear && \
 cd /tmp/pear && \
 pecl bundle xdebug-3.1.6 && \
 docker-php-ext-install /tmp/pear/xdebug && \
 rm -Rf /tmp/pear

RUN apk add --no-cache bash

COPY --chown=root:root --chmod=0755 files/entry-point.sh /entry-point.sh
COPY --chown=root:root --chmod=0644 files/usr/local/etc/php/conf.d/wp-xdebug.ini.tpl /usr/local/etc/php/conf.d/wp-xdebug.ini.tpl

CMD [ "/usr/local/sbin/php-fpm", "-F" ]
ENTRYPOINT ["/entry-point.sh"]
