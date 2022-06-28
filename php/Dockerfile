FROM php:8-fpm as php-container-image

RUN docker-php-ext-install pdo pdo_mysql

RUN rm -rf /srv
RUN mkdir /srv
COPY ./srv /srv
