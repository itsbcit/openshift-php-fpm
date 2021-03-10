FROM bcit/alpine:3.13-latest

ENV HOME /application

LABEL build_id="1615418649"

RUN apk add --no-cache \
    curl \
    git \
    rsync \
    wget \
    php8=8.0.2-r0 \
    php8-bcmath=8.0.2-r0 \
    php8-bz2=8.0.2-r0 \
    php8-calendar=8.0.2-r0 \
    php8-cgi=8.0.2-r0 \
    php8-common=8.0.2-r0 \
    php8-ctype=8.0.2-r0 \
    php8-curl=8.0.2-r0 \
    php8-dba=8.0.2-r0 \
    php8-dom=8.0.2-r0 \
    php8-enchant=8.0.2-r0 \
    php8-exif=8.0.2-r0 \
    php8-fileinfo=8.0.2-r0 \
    php8-fpm=8.0.2-r0 \
    php8-ftp=8.0.2-r0 \
    php8-gd=8.0.2-r0 \
    php8-gettext=8.0.2-r0 \
    php8-gmp=8.0.2-r0 \
    php8-iconv=8.0.2-r0 \
    php8-imap=8.0.2-r0 \
    php8-intl=8.0.2-r0 \
    php8-ldap=8.0.2-r0 \
    php8-mbstring=8.0.2-r0 \
    php8-mysqli=8.0.2-r0 \
    php8-mysqlnd=8.0.2-r0 \
    php8-odbc=8.0.2-r0 \
    php8-opcache=8.0.2-r0 \
    php8-openssl=8.0.2-r0 \
    php8-pcntl=8.0.2-r0 \
    php8-pear=8.0.2-r0 \
    php8-pdo=8.0.2-r0 \
    php8-pdo_dblib=8.0.2-r0 \
    php8-pdo_mysql=8.0.2-r0 \
    php8-pdo_odbc=8.0.2-r0 \
    php8-pdo_pgsql=8.0.2-r0 \
    php8-pdo_sqlite=8.0.2-r0 \
    php8-pgsql=8.0.2-r0 \
    php8-phar=8.0.2-r0 \
    php8-posix=8.0.2-r0 \
    php8-pspell=8.0.2-r0 \
    php8-session=8.0.2-r0 \
    php8-shmop=8.0.2-r0 \
    php8-simplexml=8.0.2-r0 \
    php8-snmp=8.0.2-r0 \
    php8-soap=8.0.2-r0 \
    php8-sockets=8.0.2-r0 \
    php8-sodium=8.0.2-r0 \
    php8-sqlite3=8.0.2-r0 \
    php8-sysvmsg=8.0.2-r0 \
    php8-sysvsem=8.0.2-r0 \
    php8-sysvshm=8.0.2-r0 \
    php8-tidy=8.0.2-r0 \
    php8-tokenizer=8.0.2-r0 \
    php8-xml=8.0.2-r0 \
    php8-xmlreader=8.0.2-r0 \
    php8-xmlwriter=8.0.2-r0 \
    php8-xsl=8.0.2-r0 \
    php8-zip=8.0.2-r0 \
    php8-pecl-ast \
    php8-pecl-event \
    php8-pecl-igbinary \
    php8-pecl-imagick \
    php8-pecl-lzf \
    php8-pecl-mailparse \
    php8-pecl-mcrypt \
    php8-pecl-memcached \
    php8-pecl-msgpack \
    php8-pecl-oauth \
    php8-pecl-redis \
    php8-pecl-timezonedb \
    php8-pecl-vips \
    php8-pecl-yaml

RUN pear8 channel-update pear.php.net && pear8 install  \
    mail_mime \
    mdb2_driver_mysql \
    auth_sasl2 \
    net_socket \
    mdb2_driver_pgsql \
    net_smtp \
    net_idna2 \
    auth_sasl \
    net_smtp \
    net_sieve

RUN apk add --no-cache \
    php8=8.0.2-r0 \
    php8-phpdbg=8.0.2-r0 \
    php8-pecl-xdebug

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN ln -s /usr/bin/php8 /usr/bin/php

RUN sed -i "s/;error_log = log\/php8\/error.log/error_log = \/dev\/stderr/" /etc/php8/php-fpm.conf
COPY php-fpm-www.conf /etc/php8/php-fpm.d/www.conf
RUN chmod 775 -R /etc/php8/

COPY 50-copy-php-fpm-config.sh /docker-entrypoint.d/

RUN mkdir -p /application \
 && chown 0:0 /application \
 && chmod 775 /application

WORKDIR /application
EXPOSE 9000
CMD ["/usr/sbin/php-fpm8", "-F", "-O", "-y", "/etc/php8/php-fpm.conf"]
