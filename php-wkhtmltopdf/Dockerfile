FROM php:8.3-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        libfontconfig1 \
        libfreetype6 \
        libjpeg62-turbo \
        libx11-6 \
        libxcb1 \
        libxext6 \
        libxrender1 \
        wkhtmltopdf \
        wget \
        xfonts-75dpi \
        xfonts-base \
    ;

RUN docker-php-ext-install opcache


# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer/composer:2-bin --link /composer /usr/bin/composer

COPY . .

RUN composer install

EXPOSE 80

CMD ["apache2-foreground"]
