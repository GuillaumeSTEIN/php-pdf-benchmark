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



# install npm
RUN apt-get update; \
    apt-get install -y \
    nodejs \
    npm \
    ;

# install chrome
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# install puppeteer
RUN npm install puppeteer

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer/composer:2-bin --link /composer /usr/bin/composer

COPY . .

RUN composer install

EXPOSE 80

CMD ["apache2-foreground"]
