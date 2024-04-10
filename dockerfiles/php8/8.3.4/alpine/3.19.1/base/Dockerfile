# Build image for easyswoolexuesi2021/php:8.3.4-alpine3.19.1-base
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM alpine:3.19.1

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
    tzdata \
    pcre \
    php83 \
    php83-bcmath \
    php83-curl \
    php83-ctype \
    php83-dom \
    php83-fileinfo \
    php83-gd \
    php83-iconv \
    php83-json \
    php83-mbstring \
    php83-mysqli \
    php83-mysqlnd \
    php83-opcache \
    php83-openssl \
    php83-pcntl \
    php83-pdo \
    php83-pdo_mysql \
    php83-pdo_sqlite \
    php83-phar \
    php83-posix \
    php83-redis \
    php83-simplexml \
    php83-sockets \
    php83-sodium \
    php83-sysvshm \
    php83-sysvmsg \
    php83-sysvsem \
    php83-tokenizer \
    php83-zip \
    php83-zlib \
    php83-xml \
    php83-xmlreader \
    php83-xmlwriter \
    php83-mongodb \
    && ln -sf /usr/bin/php83 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php83 \
    #  ---------- some config ----------
    && cd /etc/php83 \
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
