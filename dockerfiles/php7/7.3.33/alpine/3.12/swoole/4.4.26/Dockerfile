# Build image for easyswoolexuesi2021/easyswoole:php7.3.33-alpine3.12-swoole4.4.26
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM easyswoolexuesi2021/php:7.3.33-alpine3.12-base

LABEL maintainer="EasySwoole Developers https://www.easyswoole.com" version="1.0" license="Apache 2.0"

##
# ---------- env settings ----------
##
ENV SWOOLE_VERSION=4.4.26 \
    #  install and remove building packages
    PHPIZE_DEPS="autoconf dpkg-dev dpkg file g++ gcc libc-dev make php7-dev php7-pear pkgconf re2c pcre-dev pcre2-dev zlib-dev libtool automake"
ENV COMPOSER_VERSION=${COMPOSER_VERSION:-"2.0.2"}

# update
RUN set -ex \
    # install composer
    && curl -sfL https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && chmod +x /usr/bin/composer \
    && composer self-update --clean-backups ${COMPOSER_VERSION} \
    && apk update \
    # for swoole extension libaio linux-headers
    && apk add --no-cache libstdc++ openssl git bash \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS libaio-dev openssl-dev \
    # download
    && cd /tmp \
    && curl -SL "https://github.com/swoole/swoole-src/archive/v${SWOOLE_VERSION}.tar.gz" -o swoole.tar.gz \
    && ls -alh \
    # php extension:swoole
    && cd /tmp \
    && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && ln -s /usr/bin/phpize7 /usr/local/bin/phpize \
    && ln -s /usr/bin/php-config7 /usr/local/bin/php-config \
    && ( \
        cd swoole \
        && phpize \
        && ./configure --enable-openssl --enable-http2 --enable-mysqlnd --enable-openssl \
        && make -s -j$(nproc) && make install \
    ) \
    && echo "extension=swoole.so" > /etc/php7/conf.d/swoole.ini \
    # clear
    && php -v \
    && php -m \
    && php --ri swoole \
    && composer \
    # ---------- clear works ----------
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php*

WORKDIR /var/www

RUN echo -e "\033[42;37m Build Completed :).\033[0m\n"
