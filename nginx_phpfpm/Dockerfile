FROM roskamach/centos_baseimage

MAINTAINER Rostylav Kamach <ros.kamach@gmail.com>

COPY ./thunder-8.x-2.45-core.zip /usr/share/nginx/
COPY ./template/opcache /usr/share/nginx/opcache
COPY ./template/default /etc/nginx/conf.d/default.conf
COPY ./template/10-opcache.ini /etc/php.d/10-opcache.in

WORKDIR /usr/share/nginx/

RUN \
    echo "Update pachages list" && echo "###" && \
    yum update -y > /dev/null 2>&1 && \
    ###
    echo "Install required packages" && echo "###" && \
    yum install -y \
    curl \
    git \
    unzip > /dev/null 2>&1 && \
    ###
    echo "Install PHP Extensions" && echo "###" && \
    yum install -y \
    php-dom \
    php-gd \
    php-pdo \
    php-xml \
    php-mysql \
    php-simplexml \
    php-mbstring \
    php-curl \
    php-opcache \
    php-cli > /dev/null 2>&1 && \
    ###
    echo "Unpacking Thunder CMS" && echo "###" && \
    unzip thunder-8.x-2.45-core.zip > /dev/null 2>&1 && \
    rm -rf html thunder-8.x-2.45/.git && mv thunder-8.x-2.45/ html && rm thunder-8.x-2.45-core.zip && cd html/ && \
    ###
    echo "Install Thunder CMS" && echo "###" && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php > /dev/null 2>&1 && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer > /dev/null 2>&1 && \
    composer install --no-progress --profile --prefer-dist > /dev/null 2>&1 && \
    ###
    echo "Clean cache" && echo "###" && \
    yum clean all > /dev/null 2>&1 && \
    rm -rf /var/cache/yum /var/tmp/yum-* /home/*/.composer/cache /root/.composer/cache > /dev/null 2>&1 && \
    chown -R nginx:nginx /usr/share/nginx/html > /dev/null 2>&1 && \
    cat ../opcache >> /etc/php.ini && rm ../opcache > /dev/null 2>&1 && \
    composer clear-cache > /dev/null 2>&1
  

EXPOSE 80
ENTRYPOINT [ "script.sh" ]