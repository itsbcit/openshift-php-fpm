config_path=/config
php_base_path=/etc/php7
php_conf_dir=php-fpm.d
php_overrides_dir=conf.d
php_inst_conf_file=php-fpm.conf

if [ -d $config_path ]; then
    for f in $config_path/*; do
        if [ -f $f ]; then
            cp -f $f $php_base_path/$php_conf_dir/
        fi
        if echo $f | grep -q ".ini"; then
            fn=$(echo $f | sed "s,/.*/,,")
            mv -f $php_base_path/$php_conf_dir/$fn $php_base_path/$php_overrides_dir/
        fi
    done
    if [ -e $php_base_path/$php_conf_dir/$php_inst_conf_file ]; then
        mv $php_base_path/$php_conf_dir/$php_inst_conf_file $php_base_path/
    fi
fi
