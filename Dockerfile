FROM php:7.2-fpm-alpine
WORKDIR /var/www/html

RUN apk add curl

ENV APP_VERSION="1.12.0"
ENV APP_INDEX_ROOT_PATH="/var/www/html"
ENV APP_VERSION_TYPE="community"
ENV APP_INDEX_ROOT_FILE="__FILE__"

RUN curl -L https://github.com/RainLoop/rainloop-webmail/releases/download/v${APP_VERSION}/rainloop-community-${APP_VERSION}.zip > rainloop.zip && \
  unzip rainloop.zip && \
  chown -R www-data /var/www/html && \
  find ./rainloop -type d -exec chmod 755 {} \; && \
  find ./rainloop -type f -exec chmod 644 {} \;

EXPOSE 9000

VOLUME /var/www/html
VOLUME /var/www/html/data

CMD [ "php-fpm" ]
