FROM bcit/alpine:3.9

RUN apk add --no-cache \
    php7 php7-fpm

RUN sed -i "s/;error_log = log\/php7\/error.log/error_log = \/dev\/stderr/" /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod 775 -R /etc/php7/

COPY 50-copy-php-fpm-config.sh /docker-entrypoint.d/

WORKDIR "/application"
EXPOSE 9000
CMD ["/usr/sbin/php-fpm7", "-F", "-O", "-y", "/etc/php7/php-fpm.conf"]
