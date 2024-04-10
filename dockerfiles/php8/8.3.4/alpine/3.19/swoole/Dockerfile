# Build image for easyswoolexuesi2021/easyswoole:php8.3.4-alpine3.19-swoole5.1.1
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM easyswoolexuesi2021/php:8.3.4-alpine3.19-base

LABEL maintainer="EasySwoole Developers https://www.easyswoole.com" version="1.0" license="Apache 2.0"

##
# ---------- env settings ----------
##
# --build-arg SWOOLE_VERSION=5.1.1 COMPOSER_VERSION=2.3.10
ARG SWOOLE_VERSION
ARG COMPOSER_VERSION

##
# ---------- env settings ----------
##
ENV PHP_BUILD_VERSION="82"
ENV SWOOLE_VERSION=${SWOOLE_VERSION:-"5.1.1"} \
    COMPOSER_VERSION=${COMPOSER_VERSION:-"2.3.10"} \
    #  install and remove building packages
    PHPIZE_DEPS="autoconf dpkg-dev dpkg file g++ gcc libc-dev make php${PHP_BUILD_VERSION}-dev php${PHP_BUILD_VERSION}-pear pkgconf re2c pcre-dev pcre2-dev zlib-dev libtool automake libaio-dev openssl-dev curl-dev"

# update
RUN set -ex \
    && apk update \
    # for swoole extension libaio linux-headers
    && apk add --no-cache libstdc++ openssl git bash c-ares-dev libpq-dev \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    # download
    && cd /tmp \
    && curl -SL "https://github.com/swoole/swoole-src/archive/v${SWOOLE_VERSION}.tar.gz" -o swoole.tar.gz \
    && ls -alh \
    # php extension:swoole
    && cd /tmp \
    && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && ln -s /usr/bin/phpize${PHP_BUILD_VERSION} /usr/local/bin/phpize \
    && ln -s /usr/bin/php-config${PHP_BUILD_VERSION} /usr/local/bin/php-config \
    && ( \
        cd swoole \
        && phpize \
        && ./configure --enable-openssl --enable-swoole-curl --enable-cares --enable-swoole-pgsql \
        && make -s -j$(nproc) && make install \
    ) \
    && echo "memory_limit=1G" > /etc/php${PHP_BUILD_VERSION}/conf.d/00_default.ini \
    && echo "opcache.enable_cli = 'On'" >> /etc/php${PHP_BUILD_VERSION}/conf.d/00_opcache.ini \
    && echo "extension=swoole.so" > /etc/php${PHP_BUILD_VERSION}/conf.d/50_swoole.ini \
    # install composer
    && wget -nv -O /usr/local/bin/composer https://github.com/composer/composer/releases/download/${COMPOSER_VERSION}/composer.phar \
    && chmod u+x /usr/local/bin/composer \
    # ---------- clear works ----------
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php* \
    # php info
    && php -v \
    && php -m \
    && php --ri swoole \
    && php --ri Zend\ OPcache \
    && composer

WORKDIR /var/www

RUN echo -e "\033[42;37m Build Completed :).\033[0m\n"
