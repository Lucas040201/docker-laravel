#!/bin/bash

docker build -t laravel_backend docker/php/
docker build -t laravel_database docker/postgres/
docker build -t laravel_nginx docker/nginx/
docker-compose up --build
