# php-fpm OpenShift image

## Labels

See [Docker Cloud](https://cloud.docker.com/u/bcit/repository/docker/bcit/openshift-php-fpm/tags) for full listing but the main ones are:

* [`7.3-latest-latest`](https://github.com/itsbcit/openshift-php-fpm/blob/master/7.3/Dockerfile)
* [`7.3-debug-latest`](https://github.com/itsbcit/openshift-php-fpm/blob/master/7.3-debug/Dockerfile)

## Default Behavior

Runs kitchen sink php-fpm server. Includes all the extentions! See `php_extensions:` section in [metadata.yaml](https://github.com/itsbcit/openshift-php-fpm/blob/master/metadata.yaml)

Runs on port 9000

## How to Run With Default Behavior
```bash
docker pull bcit/openshift-php-fpm
docker run -it -u 100000 -p 9000:9000 bcit/openshift-php-fpm
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
