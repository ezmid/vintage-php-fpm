FROM alpine:3.9

LABEL Maintainer="Filip Cieker <filip.cieker@ezmid.com>"

################################################################################
# Layer 1 - PHP7 + extensions
RUN apk --no-cache --update upgrade && \
    apk add \
    php7 \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-intl \
    php7-iconv \
    php7-json \
    php7-pdo_mysql \
    php7-phar \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-redis \
    php7-session \
    php7-simplexml \
    php7-soap \
    php7-sockets \
    php7-sodium \
    php7-tokenizer \
    php7-xdebug \
    php7-xml \
    php7-xmlreader \
    php7-xmlrpc \
    php7-xmlwriter \
    php7-zip \
    php7-zlib \
    curl \
    make \
    shadow

################################################################################
# Layer 4 - Patch filesystem (PHP, PHP-FPM conf etc..)
COPY docker/ /

################################################################################
# Layer 5 - Defalt non root user, 82 is www-data && clean up
ENV APP_GID=82
ENV APP_UID=82
RUN addgroup -g ${APP_GID} www-data && \
    adduser -D -u ${APP_UID} -G www-data www-data && \
    usermod -a -G root www-data && \
    apk del shadow

################################################################################
# System init
EXPOSE 9000
WORKDIR /var/www/app
USER www-data
CMD ["php-fpm7", "-F", "--fpm-config", "/etc/php7/php-fpm.conf"]
