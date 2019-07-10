FROM roskamach:ubuntu_baseimage

RUN apt-get update -y && \
    apt-get install -y \
    curl \
    git \
    unzip && \
    ###
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY ./drupal-8.7.4.zip /var/www/

WORKDIR /var/www/
RUN unzip drupal-8.7.4.zip && \
    rm -rf html drupal-8.7.4/.git && mv drupal-8.7.4/ html && rm drupal-8.7.4.zip && cd html/ && \
    ###
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-progress --profile --prefer-dist && \
    chown -R www-data:www-data /var/www/html
  

COPY ./template/default /etc/nginx/sites-available/default

EXPOSE 80
ENTRYPOINT [ "script.sh" ]