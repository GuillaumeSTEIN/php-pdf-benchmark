FROM php:8.3-apache

WORKDIR /var/www/html

RUN apt-get update; \
    apt-get install -y \
    acl \
    file \
    g++ \
    gettext \
    git \
    gnupg \
    htop \
    libfreetype6-dev \
    libicu-dev  \
    libjpeg-dev \
    libonig-dev \
    libpng-dev \
    libxslt1-dev \
    libzip-dev \
    nano \
    openssl \
    procps \
    unzip \
    wget \
    zlib1g-dev \
    ;
RUN docker-php-ext-install dom gd mbstring
#RUN docker-php-ext-install opcache


# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer/composer:2-bin --link /composer /usr/bin/composer

COPY . .

RUN composer install

EXPOSE 80

CMD ["apache2-foreground"]
