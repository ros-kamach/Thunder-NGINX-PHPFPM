FROM roskamach/ubuntu_baseimage

RUN apt-get update -y && \
    apt-get install -y \
    curl && \
    ###
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY ./drupal-8.7.4.zip /var/www/

WORKDIR /var/www/
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer create-project burdamagazinorg/thunder-project thunder --verbose --no-interaction && \
    cd thunder/ && rm /etc/nginx/sites-available/default \
    composer install --no-progress --profile --prefer-dist --verbose --no-interaction && \
    chown -R www-data:www-data /var/www/thunder/ && chmod -R 755 /var/www/thunder
  

COPY ./template/default /etc/nginx/sites-available/default

EXPOSE 80
ENTRYPOINT [ "script.sh" ]
