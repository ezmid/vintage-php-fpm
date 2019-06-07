FROM alpine:3.9

LABEL Maintainer="Filip Cieker <filip.cieker@ezmid.com>"

################################################################################
# Layer 1 - PHP7 + extensions
RUN apk --no-cache --update upgrade && \
    apk add \
    php7 \
    php7-fpm \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-tokenizer \
    php7-xml \
    php7-xmlwriter \
    composer \
    curl \
    make

################################################################################
# Layer 2 - Patch filesystem (PHP, PHP-FPM conf etc..)
COPY ./docker/7.2-base /

################################################################################
# System init
EXPOSE 9000
WORKDIR /app
CMD ["php-fpm7", "-F", "--fpm-config", "/etc/php7/php-fpm.conf"]
