# Build image for easyswoolexuesi2021/php:8.1.31-alpine3.19-base
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM alpine:3.19

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
    php81 \
    php81-bcmath \
    php81-curl \
    php81-ctype \
    php81-dom \
    php81-fileinfo \
    php81-gd \
    php81-iconv \
    php81-json \
    php81-mbstring \
    php81-mysqli \
    php81-mysqlnd \
    php81-opcache \
    php81-openssl \
    php81-pcntl \
    php81-pdo \
    php81-pdo_mysql \
    php81-pdo_sqlite \
    php81-phar \
    php81-posix \
    php81-redis \
    php81-simplexml \
    php81-sockets \
    php81-sodium \
    php81-sysvshm \
    php81-sysvmsg \
    php81-sysvsem \
    php81-tokenizer \
    php81-zip \
    php81-zlib \
    php81-xml \
    php81-xmlreader \
    php81-xmlwriter \
    php81-mongodb \
    && ln -sf /usr/bin/php81 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php81 \
    #  ---------- some config ----------
    && cd /etc/php81 \
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
