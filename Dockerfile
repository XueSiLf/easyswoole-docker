# Default Dockefile
#
# @link     https://www.easyswoole.com
# @document https://www.easyswoole.com
# @contact  https://www.easyswoole.com
# @license  https://github.com/easy-swoole/easyswoole/blob/3.x/LICENSE

FROM easyswoolexuesi2021/easyswoole:php8.1.22-alpine3.16-swoole4.8.13
LABEL maintainer="EasySwoole Developers https://www.easyswoole.com" version="1.0" license="Apache 2.0"

##
# ---------- env settings ----------
##
# --build-arg timezone=Asia/Shanghai
ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

# update
RUN set -ex \
    # show php version and extensions info
    && php -v \
    && php -m \
    && php --ri swoole \
    #  ---------- some config ----------
    && cd /etc/php81 \
    # - config PHP
    && { \
        echo "upload_max_filesize=128M"; \
        echo "post_max_size=128M"; \
        echo "memory_limit=1G"; \
        echo "date.timezone=${TIMEZONE}"; \
    } | tee php.ini \
    # - config timezone
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    # ---------- clear works ----------
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"

WORKDIR /var/www

# Composer Cache
# COPY ./composer.* /opt/www/
# RUN composer install --no-dev --no-scripts

COPY . /var/www

RUN composer install --no-dev -o && php easyswoole.php

EXPOSE 9501

ENTRYPOINT ["php", "/var/www/easyswoole.php", "server", "start"]
