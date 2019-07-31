[![Build Status](https://travis-ci.org/ezmid/vintage-php-fpm.svg?branch=master)](https://travis-ci.org/ezmid/vintage-php-fpm) ![Docker Hub Status](https://img.shields.io/docker/build/ezmid/vintage-php-fpm.svg) ![Image Pulls](https://img.shields.io/docker/pulls/ezmid/vintage-php-fpm.svg) ![Image Stars](https://img.shields.io/docker/stars/ezmid/vintage-php-fpm.svg)

# Vintage PHP-FPM

This is a simple PHP-FPM service on top of Alpine Linux.

## Versions
- PHP 7.0 -> ezmid/php-fpm:7.0-latest [DEPRECATED]
- PHP 7.1 -> ezmid/php-fpm:7.1-latest [DEPRECATED]
- PHP 7.2 -> ezmid/php-fpm:7.2-latest [DEPRACATED]
- PHP 7.2-base -> ezmid/php-fpm-base:7.2-latest
- PHP 7.2-api -> ezmid/php-fpm-api:7.2-latest [SOON]
- PHP 7.2-kafka -> ezmid/php-fpm-kafka:7.2-latest [SOON]
- PHP 7.2-swoole -> ezmid/php-fpm-kafka:7.2-latest [SOON]
- PHP 7.3 -> ezmid/php-fpm:7.3-latest
- PHP 7.3-base -> ezmid/php-fpm-base:7.3-latest

## Installation

**Requirements**
- [GIT](https://git-scm.com/) >= 2.15
- [Docker CE](https://www.docker.com/) >= 17.12.0
- [Goss](https://github.com/aelsabbahy/goss) >= 0.3
- [Make](https://www.gnu.org/software/make/) >= 4.2

**Currently Goss is not available for Windows. Build everything else works on all platforms.*

## Development
```sh
# Build the image, TAG=latest is the default value
$ make build

# Build the image with a specific tag
$ make build TAG=1.1.0

# Test the latest image
$ make test

# Test a specific tag
$ make test TAG=1.1.0

# Push the latest tag to the registry
$ make push

# Push a specific tag
$ make push TAG=1.1.0
```
