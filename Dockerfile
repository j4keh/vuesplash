FROM php:7.4-fpm

COPY install-composer.sh /
RUN apt update \
  && apt install -y wget git unzip libpq-dev libpng-dev libjpeg-dev libfreetype6-dev \
  && : 'Install Node.js' \
  &&  curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt install -y nodejs \
  && : 'Install PHP Extensions' \
  && docker-php-ext-install pdo_pgsql \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install gd \
  && : 'Install Composer' \
  && chmod 755 /install-composer.sh \
  && /install-composer.sh \
  && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html/vuesplash
