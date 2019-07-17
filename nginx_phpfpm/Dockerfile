FROM roskamach/alpine_baseimage
  
MAINTAINER Rostylav Kamach <ros.kamach@gmail.com>

RUN apk update && apk upgrade && \
    apk add \
    php7-opcache \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-dom \
    php7-session \
    php7-simplexml \
    php7-tokenizer \
    php7-xmlwriter \
    curl \
    git \
    unzip && \
    ### 
    rm -rf /var/cache/apk/*

COPY ./thunder-8.x-2.44-core.zip /usr/share/nginx/
COPY ./template/opcache /usr/share/nginx/
COPY ./template/10-opcache.ini /etc/php.d/10-opcache.in
COPY ./template/default /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/
RUN unzip thunder-8.x-2.44-core.zip && \
    rm -rf html thunder-8.x-2.44/.git && mv thunder-8.x-2.44/ html && rm thunder-8.x-2.44-core.zip && cd html/ && \
    ###
    curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer && \
    composer install --no-progress --profile --prefer-dist && \
    chown -R nginx:nginx /usr/share/nginx/html

RUN ls && cat ./opcache >> /etc/php7/php.ini && rm ./opcache

EXPOSE 80
ENTRYPOINT [ "/script.sh" ]
