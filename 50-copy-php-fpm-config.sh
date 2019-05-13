config_path=/config
php_conf_path=/etc/php7
php_inst_conf_file=php-fpm.conf

if [ -d $config_path ]; then
    for f in $config_path/*; do
        if [ -f $f ]; then
            cp -f $f $php_conf_path/php-fpm.d/
        fi
    done
    if [ -e $php_conf_path/php-fpm.d/$php_inst_conf_file ]; then
        mv $php_conf_path/php-fpm.d/$php_inst_conf_file $php_conf_path/
    fi
fi
