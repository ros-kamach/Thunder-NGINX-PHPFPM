FROM roskamach/alpine_baseimage
  
MAINTAINER Rostylav Kamach <ros.kamach@gmail.com>

COPY ./thunder-8.x-2.47-core.zip /usr/share/nginx/
COPY ./template/opcache /usr/share/nginx/
COPY ./template/10-opcache.ini /etc/php.d/10-opcache.in

WORKDIR /usr/share/nginx/
RUN \
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
    echo "Unpacking Thunder CMS Site" && echo "###" && \
    unzip thunder-8.x-2.47-core.zip > /dev/null 2>&1 && \
    rm -rf html thunder-8.x-2.47/.git && mv thunder-8.x-2.47/ html && rm thunder-8.x-2.47-core.zip && cd html/ && \
    ###
    echo "Install Thunder CMS" && echo "###" && \
    curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer > /dev/null 2>&1 && \
    composer install --no-progress --profile --prefer-dist > /dev/null 2>&1 && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    cat ../opcache >> /etc/php/7.2/php.ini && rm ../opcache && \
    ###
    echo "Clean cache" && echo "###" && \
    apk del curl git unzip > /dev/null 2>&1 && \
    rm -rf /var/cache/apk/* > /dev/null 2>&1 && \
    composer clear-cache > /dev/null 2>&1

COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK --interval=5s \
            --timeout=10s \
            --retries=3 \
            CMD curl -sS http://127.0.0.1:80/core/install.php || exit 1
ENTRYPOINT [ "/script.sh" ]
