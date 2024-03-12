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
RUN docker-php-ext-install opcache

# install npm
RUN apt-get update; \
    apt-get install -y \
    nodejs \
    npm \
    ;

# install chrome
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] https://dl-ssl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 dbus dbus-x11 --no-install-recommends;

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
