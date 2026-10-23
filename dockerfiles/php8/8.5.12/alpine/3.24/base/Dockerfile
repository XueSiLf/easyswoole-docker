# Build image for easyswoolexuesi2021/php:8.5.12-alpine3.24-base
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM alpine:3.24

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
    php85 \
    php85-bcmath \
    php85-curl \
    php85-ctype \
    php85-dom \
    php85-fileinfo \
    php85-gd \
    php85-iconv \
    php85-json \
    php85-mbstring \
    php85-mysqli \
    php85-mysqlnd \
    php85-openssl \
    php85-pcntl \
    php85-pdo \
    php85-pdo_mysql \
    php85-pdo_sqlite \
    php85-phar \
    php85-posix \
    php85-redis \
    php85-simplexml \
    php85-sockets \
    php85-sodium \
    php85-sysvshm \
    php85-sysvmsg \
    php85-sysvsem \
    php85-tokenizer \
    php85-zip \
    php85-zlib \
    php85-xml \
    php85-xmlreader \
    php85-xmlwriter \
    php85-mongodb \
    && ln -sf /usr/bin/php85 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php85 \
    #  ---------- some config ----------
    && cd /etc/php85 \
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
