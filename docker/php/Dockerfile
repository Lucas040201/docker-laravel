FROM php:8.2-fpm-alpine

ARG user=dev
ARG uid=1010

WORKDIR /var/www/html

#install php extensions
ADD ./config/install.sh .
RUN sh install.sh

#clear cache
RUN rm -rf /var/cache/apk/*

#create user to run inside container
RUN addgroup -g $uid -S $user && adduser -u $uid -S -G $user -h /home/$user -D $user
RUN mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user

#define user of container
USER dev
