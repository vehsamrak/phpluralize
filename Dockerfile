FROM php:7-cli

RUN requirements="zlib1g-dev libicu-dev git curl" \
    && apt-get update \
    && apt-get install -y zlib1g-dev libicu-dev git curl  \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

ADD src /project
WORKDIR /project
COPY composer.json /project

RUN composer install -o

CMD [ "php", "./Pluralizer.php" ]
