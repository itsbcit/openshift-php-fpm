# php-fpm OpenShift image

## Default Behavior

Runs default php-fpm server. No extensions, so probably not that useful.

Runs on port 9000

## How to Run With Default Behavior
```bash
docker pull bcit/openshift-php-fpm
docker run -it -u 100000 -p 9000:9000 bcit/openshift-php-fpm
```

## How to Modify

### Extend the Image

#### Add PHP extensions

```dockerfile
FROM bcit/openshift-php-fpm
RUN apk add --no-cache \
    php7-soap php7-ldap php7-iconv \
    php7-simplexml php7-session
```

#### Configure php-fpm

The following directories house configuration files

- `/etc/php7/conf.d/`

- `/etc/php7/php-fpm.d/`

- `/etc/php7/`

  so copy your relevent config files there. Example Dockerfile:

```dockerfile
FROM bcit/openshift-php-fpm

COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY php-fpm-www.conf /etc/php7/php-fpm.d/www.conf
COPY php-ini-overrides.ini /etc/php7/conf.d/zzz_overrides.ini
```
