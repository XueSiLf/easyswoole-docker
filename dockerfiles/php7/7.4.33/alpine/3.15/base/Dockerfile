# # Build image for easyswoolexuesi2021/php:7.4.33-alpine3.15-base
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM alpine:3.15

LABEL maintainer="EasySwoole Developers https://www.easyswoole.com" version="1.0" license="Apache 2.0"

##
# ---------- env settings ----------
##

# --build-arg timezone=Asia/Shanghai
ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

##
# ---------- building ----------
##

RUN set -ex \
    && apk update \
    && apk add --no-cache \
    # Install base packages ('ca-certificates' will install 'nghttp2-libs')
    ca-certificates \
    curl \
    tar \
    xz \
    libressl \
    tzdata \
    pcre \
    php \
    php-bcmath \
    php-curl \
    php-ctype \
    php-dom \
    php-fileinfo \
    php-gd \
    php-iconv \
    php-json \
    php-mbstring \
    php-mysqlnd \
    php-openssl \
    php-pdo \
    php-pdo_mysql \
    php-pdo_sqlite \
    php-phar \
    php-posix \
    php7-redis \
    php-simplexml \
    php-sockets \
    php-sodium \
    php-sysvshm \
    php-sysvmsg \
    php-sysvsem \
    php-tokenizer \
    php-zip \
    php-zlib \
    php-xml \
    php-xmlreader \
    php-xmlwriter \
    php-pcntl \
    php-opcache \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php7 \
    #  ---------- some config,clear work ----------
    && cd /etc/php7 \
    # - config PHP
    && { \
        echo "upload_max_filesize=100M"; \
        echo "post_max_size=108M"; \
        echo "memory_limit=1024M"; \
        echo "date.timezone=${TIMEZONE}"; \
    } | tee conf.d/99-overrides.ini \
    # - config timezone
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"
