FROM roskamach/ubuntu_baseimage

COPY ./thunder-8.x-2.45-core.zip /usr/share/nginx/

WORKDIR /usr/share/nginx/
RUN \
    echo "Update pachages list" && echo "###" && \
    apt-get update -y > /dev/null 2>&1 && \
    ###
    echo "Install required packages" && echo "###" && \
    ###
    apt-get install -y --no-install-recommends \
    curl git unzip > /dev/null 2>&1 && \
    echo "Install PHP Extensions" && echo "###" && \
    apt-get install -y --no-install-recommends \
    php7.2-dom \
    php7.2-gd \
    php7.2-pdo \
    php7.2-xml \
    php7.2-mysql \
    php7.2-simplexml \
    php7.2-mbstring \
    php7.2-curl > /dev/null 2>&1 && \
    ###
    echo "Clean packages and repo" && echo "###" && \
    apt-get clean autoclean autoremove > /dev/null 2>&1 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ###
    echo "Unpacking Drupal Site" && echo "###" && \
    unzip thunder-8.x-2.45-core.zip > /dev/null 2>&1 && \
    rm -rf html thunder-8.x-2.45/.git && mv thunder-8.x-2.45/ html && rm thunder-8.x-2.45-core.zip && cd html/ && \
    ###
    echo "Install Drupal" && echo "###" && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php > /dev/null 2>&1 && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer > /dev/null 2>&1 && \
    composer install --no-progress --profile --prefer-dist > /dev/null 2>&1 && \
    chown -R www-data:www-data /usr/share/nginx/html && \
    ###
    echo "Clean Composer chache" && echo "###" && \
    composer clear-cache > /dev/null 2>&1

COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
ENTRYPOINT [ "script.sh" ] 