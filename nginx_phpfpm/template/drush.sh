#!/bin/bash

# Add Enviroment to Progect "DRUSH_INSTALL=yes" to Install DRUSH
if [[ "${DRUSH_INSTALL}" == "yes" ]]
    then
        echo "Installing DRUSH"
        cd /usr/share/nginx/html/
        composer require drush/drush:master
    else
        echo "###"
        echo  Skip DRUSH installation. Enviroment "DRUSH_INSTALL" is  $DRUSH_INSTALL, must be "yes"
        echo "###"
fi

# Add Enviroment to Progect "CONNECT_TO_DB=yes" to Install Site by DRUSH
if [[ "${CONNECT_TO_DB}" == "yes" ]]
    then
        echo "Install site by DRUSH"
        cd /usr/share/nginx/html/
        vendor/bin/drush -y si \
        --db-url=mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@${MYSQL_HOST}/${MYSQL_DATABASE} \
        --site-name=Example --account-name=admin --account-pass=admin --sites-subdir=default
        #mv /usr/share/nginx/settings.php /usr/share/nginx/html/sites/default/
        #sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php/7.2/php.ini
        #sed -i "s|MYSQL_DATABASE|'database' => '${MYSQL_DATABASE}',|i" /usr/share/nginx/html/sites/default/settings.php
        #sed -i "s|MYSQL_USER|'username' => '${MYSQL_USER}',|i" /usr/share/nginx/html/sites/default/settings.php
        #sed -i "s|MYSQL_PASSWORD|'password' => '${MYSQL_PASSWORD}',|i" /usr/share/nginx/html/sites/default/settings.php
        #sed -i "s|MYSQL_PORT|'host' => '${MYSQL_PORT}',|i" /usr/share/nginx/html/sites/default/settings.php
        #sed -i "s|MYSQL_HOST|'port' => '${MYSQL_HOST}',|i" /usr/share/nginx/html/sites/default/settings.php
        #tail -n 9  /usr/share/nginx/html/sites/default/settings.php
    else
        echo "###"
        echo  Skip connection to Data_Base. Enviroment "CONNECT_TO_DB" is  $CONNECT_TO_DB, must be "yes"
        rm -f settings.php
        echo "###"
fi
