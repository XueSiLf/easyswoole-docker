# Build image for easyswoolexuesi2021/php:8.4.1-alpine3.21-base
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM alpine:3.21

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
    php84 \
    php84-bcmath \
    php84-curl \
    php84-ctype \
    php84-dom \
    php84-fileinfo \
    php84-gd \
    php84-iconv \
    php84-json \
    php84-mbstring \
    php84-mysqli \
    php84-mysqlnd \
    php84-opcache \
    php84-openssl \
    php84-pcntl \
    php84-pdo \
    php84-pdo_mysql \
    php84-pdo_sqlite \
    php84-phar \
    php84-posix \
    php84-redis \
    php84-simplexml \
    php84-sockets \
    php84-sodium \
    php84-sysvshm \
    php84-sysvmsg \
    php84-sysvsem \
    php84-tokenizer \
    php84-zip \
    php84-zlib \
    php84-xml \
    php84-xmlreader \
    php84-xmlwriter \
    php84-mongodb \
    && ln -sf /usr/bin/php84 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php84 \
    #  ---------- some config ----------
    && cd /etc/php84 \
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
