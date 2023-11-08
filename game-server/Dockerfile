# syntax=docker/dockerfile:1

FROM php:8.2-cli-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/install-php-extensions

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN install-php-extensions @composer opcache pdo_mysql redis xsl zip xdebug
