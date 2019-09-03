FROM bcit/alpine:3.10
LABEL build_id="1567535634"

RUN apk add --no-cache \
    php7=7.3.9-r0 \
    php7-common=7.3.9-r0 \
    php7-ctype=7.3.9-r0 \
    php7-curl=7.3.9-r0 \
    php7-dom=7.3.9-r0 \
    php7-fpm=7.3.9-r0 \
    php7-gd=7.3.9-r0 \
    php7-intl=7.3.9-r0 \
    php7-json=7.3.9-r0 \
    php7-ldap=7.3.9-r0 \
    php7-mbstring=7.3.9-r0 \
    php7-mysqli=7.3.9-r0 \
    php7-mysqlnd=7.3.9-r0 \
    php7-openssl=7.3.9-r0 \
    php7-phar=7.3.9-r0 \
    php7-xml=7.3.9-r0 \
    php7-xmlreader=7.3.9-r0 \
    php7-zip=7.3.9-r0 \
    php7-pecl-redis \
    php7-pecl-mcrypt

RUN sed -i "s/;error_log = log\/php7\/error.log/error_log = \/dev\/stderr/" /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod 775 -R /etc/php7/

COPY 50-copy-php-fpm-config.sh /docker-entrypoint.d/

WORKDIR "/application"
EXPOSE 9000
CMD ["/usr/sbin/php-fpm7", "-F", "-O", "-y", "/etc/php7/php-fpm.conf"]
