FROM bcit/alpine 

RUN apk add --no-cache \
    php7 php7-fpm


# COPY php-fpm.conf /etc/php7/php-fpm.conf replaced with below
RUN sed -i "s/;error_log = log\/php7\/error.log/error_log = \/dev\/stderr/" /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf

# from docker/openshift-php-fpm on stash

# # Install selected extensions and other stuff
# RUN apk --no-cache add libpng-dev curl less git zip ca-certificates rsync
# RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
#     php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
#     php7-mbstring php7-gd php7-zip php7-mcrypt php7-xdebug \
#     --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
#     --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

#this one is wordpress specific
# COPY php-ini-overrides.ini /etc/php7/conf.d/zzz_overrides.ini

# # Smoke test PHP
# RUN echo '*** php -v:' 1>&2 && php -v && \
#     echo '*** php -m:' 1>&2 && php -m && \
#     echo '*** php-fpm7 -t:' 1>&2 && php-fpm7 -t

WORKDIR "/application"

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F", "-O", "-y", "/etc/php7/php-fpm.conf"]



# from itop php-fpm 
# RUN apk add --no-cache \
#     php7-soap php7-ldap php7-iconv \
#     php7-simplexml php7-session graphviz 