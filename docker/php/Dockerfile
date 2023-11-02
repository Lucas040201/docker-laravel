FROM php:8.2-fpm-alpine

ARG user=dev
WORKDIR /var/www/html

#install php extensions
ADD ./config/install.sh .
RUN sh install.sh

#clear cache
RUN rm -rf /var/cache/apk/*

#create user to run inside container
RUN adduser -D $user
RUN adduser $user www-data
RUN chown -R $user:www-data /var/www/html

#define user of container
USER dev
