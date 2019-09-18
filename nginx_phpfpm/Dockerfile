FROM roskamach/alpine_baseimage:latest

MAINTAINER Rostylav Kamach <ros.kamach@gmail.com>

COPY ./template/drush.sh /usr/share/nginx/
COPY ./template/default.settings.php /usr/share/nginx/default.settings.php
COPY ./template/opcache /usr/share/nginx/
COPY ./template/10-opcache.ini /etc/php.d/10-opcache.ini

WORKDIR /usr/share/nginx/
RUN \
    echo "Download Thunder" && echo "###" && \
    curl -L https://ftp.drupal.org/files/projects/thunder-8.x-2.49-core.zip -o /usr/share/nginx/thunder-8.x-2.49-core.zip > /dev/null 2>&1 && \
    echo "Update pachages list" && echo "###" && \
    apk update > /dev/null 2>&1 && apk upgrade > /dev/null 2>&1 && \
    ###
    echo "Install required packages" && echo "###" && \
    apk add --no-cache \
    curl git unzip > /dev/null 2>&1 && \
    ###
    echo "Install PHP Extensions" && echo "###" && \
    apk add --no-cache \
    php7.2-phar \
    php7.2-json \
    php7.2-openssl \
    php7.2-tokenizer \
    php7.2-dom \
    php7.2-gd \
    php7.2-pdo \
    php7.2-xml \
    php7.2-simplexml \
    php7.2-xmlwriter \
    php7.2-mbstring \
    php7.2-session \
    php7.2-pdo \
    php7.2-opcache \
    php7.2-mysqlnd \
    php7.2-pdo_mysql \
    php7.2-curl > /dev/null 2>&1 && \
    ###
    echo "Chainge PHP parameters" && echo "###" && \
    sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php/7.2/php.ini && \
    ###
    echo "Unpacking Thunder CMS Site" && echo "###" && \
    unzip thunder-8.x-2.49-core.zip > /dev/null 2>&1 && \
    rm -rf html thunder-8.x-2.49/.git && mv thunder-8.x-2.49/ html && rm thunder-8.x-2.49-core.zip && cd html/ && \
    ###
    echo "Install Thunder CMS" && echo "###" && \
    curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer > /dev/null 2>&1 && \
    composer install --no-progress --profile --prefer-dist > /dev/null 2>&1 && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    cat ../opcache >> /etc/php/7.2/php.ini && rm ../opcache && \
    ###
    echo "Drush Install and connect (On "yes" veriable)" && echo "###" && \
    bash /usr/share/nginx/drush.sh && \
    ###
    echo "Clean cache" && echo "###" && \
    apk del unzip > /dev/null 2>&1 && \
    rm -rf /var/cache/apk/* > /dev/null 2>&1 && \
    composer clear-cache > /dev/null 2>&1

COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK --interval=5s \
            --timeout=10s \
            --retries=3 \
            CMD curl -sS http://127.0.0.1:80/core/install.php || exit 1
ENTRYPOINT [ "/script.sh" ]
