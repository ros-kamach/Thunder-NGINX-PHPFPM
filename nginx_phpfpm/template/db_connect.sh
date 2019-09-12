#!/bin/bash
# Add Enviroment to Progect "CONNECT_TO_DB=yes" to apply script
ENV=$1
PHP_MEMORY_LIMIT=$2
MYSQL_DATABASE=$3
MYSQL_PASSWORD=$4
MYSQL_PORT=$5
MYSQL_HOST=$6

if [[ "${ENV}" == "yes" ]]
    then
        sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php/7.2/php.ini
        sed -i "s|MYSQL_DATABASE|'database' => '${MYSQL_DATABASE}',|i" /usr/share/nginx/html/sites/default/settings.php
        sed -i "s|MYSQL_PASSWORD|'password' => '${MYSQL_PASSWORD}',|i" /usr/share/nginx/html/sites/default/settings.php
        sed -i "s|MYSQL_PORT|'host' => '${MYSQL_PORT}',|i" /usr/share/nginx/html/sites/default/settings.php
        sed -i "s|MYSQL_DATABASE|'port' => '${MYSQL_HOST}',|i" /usr/share/nginx/html/sites/default/settings.php
        tail -n 9  /usr/share/nginx/html/sites/default/settings.php
    else
        echo  Skip connection to Data_Base. Enviroment "$CONNECT_TO_DB" is  '' ${ENV}'', must be "yes"
fi
echo ${PHP_MEMORY_LIMIT}
echo ${MYSQL_DATABASE}
echo ${MYSQL_PASSWORD}
echo ${MYSQL_PASSWORD}
echo ${MYSQL_PORT}
echo ${MYSQL_HOST}
