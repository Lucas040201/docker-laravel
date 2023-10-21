FROM php:fpm-alpine
WORKDIR /var/www/html
ADD ./config/install.sh .
RUN apk update && apk upgrade
RUN sh install.sh
RUN adduser -D user
USER user