FROM roskamach/ubuntu_baseimage

COPY ./thunder-8.x-2.44-core.zip /usr/share/nginx/

WORKDIR /usr/share/nginx/
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    ### PHP Extensions
    php7.2-dom \
    php7.2-gd \
    php7.2-pdo \
    php7.2-xml \
    php7.2-mysql \
    php7.2-simplexml \
    php7.2-mbstring \
    php7.2-curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    unzip thunder-8.x-2.44-core.zip && \
    rm -rf html thunder-8.x-2.44/.git && mv thunder-8.x-2.44/ html && rm thunder-8.x-2.44-core.zip && cd html/ && \
    ###
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-progress --profile --prefer-dist && \
    chown -R www-data:www-data /usr/share/nginx/html
  
COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
ENTRYPOINT [ "script.sh" ] 
