FROM php:7-cli

RUN requirements="zlib1g-dev libicu-dev git curl" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && apt-get purge --auto-remove -y

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

ADD src /usr/src/myapp
WORKDIR /usr/src/myapp
COPY composer.json /usr/src/myapp

RUN composer install -o

CMD [ "php", "./Pluralizer.php" ]