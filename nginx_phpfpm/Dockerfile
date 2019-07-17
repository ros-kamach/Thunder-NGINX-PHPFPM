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

COPY ./thunder-8.x-2.44-core.zip /usr/share/nginx/

WORKDIR /usr/share/nginx/
RUN unzip thunder-8.x-2.44-core.zip && \
    rm -rf html thunder-8.x-2.44/.git && mv thunder-8.x-2.44/ html && rm thunder-8.x-2.44-core.zip && cd html/ && \
    ###
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-progress --profile --prefer-dist && \
    chown -R nginx:nginx /usr/share/nginx/html
COPY ./template/opcache /usr/share/nginx/opcache
RUN cat ./opcache >> /etc/php.ini && rm ./opcache

COPY ./template/default /etc/nginx/conf.d/default.conf

EXPOSE 80
ENTRYPOINT [ "script.sh" ]
