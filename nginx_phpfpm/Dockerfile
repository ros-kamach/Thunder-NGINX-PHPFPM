FROM roskamach/centos_baseimage
  
MAINTAINER Rostylav Kamach <ros.kamach@gmail.com>

RUN yum update -y && \
    yum install -y \
    curl \
    git \
    unzip && \
    ### 
    yum clean all && \
    rm -rf /var/cache/yum

WORKDIR /var/www/
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer
   #curl -sS https://getcomposer.org/installer -o composer-setup.php && \
   # php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
WORKDIR /var/www/
RUN composer create-project thunder/thunder-project thunder --no-interaction --no-install
    #composer create-project burdamagazinorg/thunder-project thunder --verbose --no-interaction && \
WORKDIR /var/www/thunder
RUN composer install --no-progress --profile --prefer-dist -vvv --no-interaction
WORKDIR /var/www/thunder
RUN composer drupal:scaffold && \
    chown -R nginx:nginx /var/www/thunder && chmod -R 755 /var/www/thunder

COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
ENTRYPOINT [ "script.sh" ]
