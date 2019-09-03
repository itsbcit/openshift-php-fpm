FROM bcit/alpine:3.10
LABEL build_id="1567548480"

RUN apk add --no-cache \
    curl \
    git \
    rsync \
    wget \
    php7=7.3.9-r0 \
    php7-bcmath=7.3.9-r0 \
    php7-bz2=7.3.9-r0 \
    php7-calendar=7.3.9-r0 \
    php7-cgi=7.3.9-r0 \
    php7-common=7.3.9-r0 \
    php7-ctype=7.3.9-r0 \
    php7-curl=7.3.9-r0 \
    php7-dba=7.3.9-r0 \
    php7-dom=7.3.9-r0 \
    php7-enchant=7.3.9-r0 \
    php7-exif=7.3.9-r0 \
    php7-fileinfo=7.3.9-r0 \
    php7-fpm=7.3.9-r0 \
    php7-ftp=7.3.9-r0 \
    php7-gd=7.3.9-r0 \
    php7-gettext=7.3.9-r0 \
    php7-gmp=7.3.9-r0 \
    php7-iconv=7.3.9-r0 \
    php7-imap=7.3.9-r0 \
    php7-intl=7.3.9-r0 \
    php7-json=7.3.9-r0 \
    php7-ldap=7.3.9-r0 \
    php7-mbstring=7.3.9-r0 \
    php7-mysqli=7.3.9-r0 \
    php7-mysqlnd=7.3.9-r0 \
    php7-odbc=7.3.9-r0 \
    php7-opcache=7.3.9-r0 \
    php7-openssl=7.3.9-r0 \
    php7-pcntl=7.3.9-r0 \
    php7-pdo=7.3.9-r0 \
    php7-pdo_dblib=7.3.9-r0 \
    php7-pdo_mysql=7.3.9-r0 \
    php7-pdo_odbc=7.3.9-r0 \
    php7-pdo_pgsql=7.3.9-r0 \
    php7-pdo_sqlite=7.3.9-r0 \
    php7-pgsql=7.3.9-r0 \
    php7-phar=7.3.9-r0 \
    php7-posix=7.3.9-r0 \
    php7-pspell=7.3.9-r0 \
    php7-recode=7.3.9-r0 \
    php7-session=7.3.9-r0 \
    php7-shmop=7.3.9-r0 \
    php7-simplexml=7.3.9-r0 \
    php7-snmp=7.3.9-r0 \
    php7-soap=7.3.9-r0 \
    php7-sockets=7.3.9-r0 \
    php7-sodium=7.3.9-r0 \
    php7-sqlite3=7.3.9-r0 \
    php7-sysvmsg=7.3.9-r0 \
    php7-sysvsem=7.3.9-r0 \
    php7-sysvshm=7.3.9-r0 \
    php7-tidy=7.3.9-r0 \
    php7-tokenizer=7.3.9-r0 \
    php7-wddx=7.3.9-r0 \
    php7-xml=7.3.9-r0 \
    php7-xmlreader=7.3.9-r0 \
    php7-xmlrpc=7.3.9-r0 \
    php7-xmlwriter=7.3.9-r0 \
    php7-xsl=7.3.9-r0 \
    php7-zip=7.3.9-r0 \
    php7-pear-mail_mime \
    php7-pear-mdb2_driver_mysql \
    php7-pear-auth_sasl2 \
    php7-pear-net_socket \
    php7-pear-mdb2_driver_pgsql \
    php7-pear-net_smtp \
    php7-pear-net_idna2 \
    php7-pear-auth_sasl \
    php7-pear-net_smtp-doc \
    php7-pear-net_sieve \
    php7-pecl-amqp \
    php7-pecl-ast \
    php7-pecl-couchbase \
    php7-pecl-event \
    php7-pecl-igbinary \
    php7-pecl-imagick \
    php7-pecl-lzf \
    php7-pecl-mailparse \
    php7-pecl-mcrypt \
    php7-pecl-memcached \
    php7-pecl-msgpack \
    php7-pecl-oauth \
    php7-pecl-protobuf \
    php7-pecl-redis \
    php7-pecl-ssh2 \
    php7-pecl-timezonedb \
    php7-pecl-vips \
    php7-pecl-yaml \
    php7-pecl-zmq

RUN apk add --no-cache \
    php7=7.3.9-r0 \
    php7-phpdbg=7.3.9-r0 \
    php7-pecl-xdebug

COPY --from=geshan/php-composer-alpine:php7 /usr/bin/composer /usr/bin/composer

RUN sed -i "s/;error_log = log\/php7\/error.log/error_log = \/dev\/stderr/" /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod 775 -R /etc/php7/

COPY 50-copy-php-fpm-config.sh /docker-entrypoint.d/

WORKDIR "/application"
EXPOSE 9000
CMD ["/usr/sbin/php-fpm7", "-F", "-O", "-y", "/etc/php7/php-fpm.conf"]
