# easyswoole-docker

## Supported tags and respective Dockerfile links

tag format:

-   7.4: php version, support 7.3/7.4/8.1/8.2, Recommend 7.4
-   3.12: alpine version, support alpine 3.12/3.15/3.16/3.18, recommend 3.15
-   4.4.26: swoole version

support:

-   [`php7.3.33-alpine3.12-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.3.33/alpine/3.12/base/Dockerfile)
-   [`php7.3.33-alpine3.12-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/Dockerfile)，[`php7.3.33-alpine3.12-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/4.4.26/Dockerfile)

-   [`php7.4.33-alpine3.15-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.3.33/alpine/3.15/base/Dockerfile)
-   [`php7.4.33-alpine3.15-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/Dockerfile)，[`php7.4.33-alpine3.15-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/4.4.26/Dockerfile)

-   [`php8.1.22-alpine3.16-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/base/Dockerfile)
-   [`php8.1.22-alpine3.16-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/Dockerfile)，[`php8.1.22-alpine3.16-swoole5.0.3`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/5.0.3/Dockerfile)

-   [`php8.2.8-alpine3.18-base`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php8/8.2.8/alpine/3.18/base/Dockefile)
-   [`php8.2.8-alpine3.18-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/Dockerfile)，[`php8.2.8-alpine3.18-swoole5.0.3`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/5.0.3/Dockerfile)



## Quick reference

-   [easyswoole](https://github.com/easy-swoole)
-   [easyswoole doc](https://www.easyswoole.com/)

## How to use this image

Added  [Dockerfile](https://github.com/XueSiLf/easyswoole-docker/blob/main/Dockerfile)  to your project.

## Info

Base image contains extensions below:

```bash
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
gd
hash
iconv
igbinary
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
standard
swoole
sysvmsg
sysvsem
sysvshm
tokenizer
xml
xmlwriter
zip
zlib
```
