#!/bash/sh

separator() {
  echo '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
  echo $1
  echo '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
  echo ''
  echo ''
}

# Installing php extensions
install_dependencies() {
    separator 'Installing php extensions'
    apk update && apk add oniguruma-dev zlib-dev libpng-dev postgresql-dev libzip-dev
    docker-php-ext-install mbstring exif pcntl bcmath gd pgsql pdo_pgsql zip
    apk update && apk upgrade
}

# Installing php composer
install_composer() {
    separator 'Install php composer'
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    separator 'Verify instalation'
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    separator 'Execute Instalation'
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    separator 'Move composer bin to /usr/local/bin/composer'
    mv composer.phar /usr/local/bin/composer
}

install_dependencies
install_composer