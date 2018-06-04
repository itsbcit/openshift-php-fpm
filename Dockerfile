FROM bcit/alpine 

RUN apk add --no-cache \
    php7 php7-fpm


# COPY php-fpm.conf /etc/php7/php-fpm.conf replaced with below
RUN sed -i "s/;error_log = log\/php7\/error.log/error_log = \/dev\/stderr/" /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR "/application"
EXPOSE 9000
CMD ["/usr/sbin/php-fpm7", "-F", "-O", "-y", "/etc/php7/php-fpm.conf"]
