English | [中文](./README-CN.md)

# easyswoole-docker

## Develop in Docker

If your native environment does not meet the EasySwoole system requirements, or if you are unfamiliar with system configuration, you can run and develop the EasySwoole project as follows using Docker.

### Run Container

In the following example the host will be mapped to the local directory `/workspace/project`:

> If `the selinux-enabled` option is enabled when docker starts, access to host resources in the container will be restricted, so you should add the `--privileged -u root` option when starting the container.

```bash
docker run --name easyswoole \
-v /workspace/project:/var/www/project \
-p 9501:9501 -it \
--privileged -u root \
--entrypoint /bin/sh \
easyswoolexuesi2021/easyswoole:php8.2.17-alpine3.19.1-swoole5.1.1
```

The public images you can choose from: 

#### php 7.3

- `easyswoolexuesi2021/easyswoole:php7.3.33-alpine3.12-swoole4.4.26`

#### php 7.4

- `easyswoolexuesi2021/easyswoole:php7.4.33-alpine3.15-swoole4.4.26`

#### php 8.1

- `easyswoolexuesi2021/easyswoole:php8.1.22-alpine3.16-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.1.22-alpine3.16-swoole5.1.1`
- `easyswoolexuesi2021/easyswoole:php8.1.27-alpine3.18-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.1.27-alpine3.18-swoole5.1.1`

#### php 8.2

- `easyswoolexuesi2021/easyswoole:php8.2.8-alpine3.18-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.2.8-alpine3.18-swoole5.1.1`
- `easyswoolexuesi2021/easyswoole:php8.2.14-alpine3.19-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.2.14-alpine3.19-swoole5.1.1`
- `easyswoolexuesi2021/easyswoole:php8.2.17-alpine3.19-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.2.17-alpine3.19-swoole5.1.1`

#### php 8.3

- `easyswoolexuesi2021/easyswoole:php8.3.4-alpine3.19-swoole4.8.13`
- `easyswoolexuesi2021/easyswoole:php8.3.4-alpine3.19-swoole5.1.1`

### Create Project

```bash
cd /var/www/project
composer require easyswoole/easyswoole
php vendor/bin/easyswoole.php install
# php vendor/bin/easyswoole install # When the EasySwoole framework version in your project is less than 3.7.1.
```

> In some environments, such as the `Docker` environment of the `Win10` system. Virtual machine shared directory cannot be used as the `Temp` directory of the `EasySwoole` framework, as it will not be able to create sockets due to insufficient permissions. This will result in an error message: `listen xxxxx.lock fail`. To do so, you can manually set `TEMP_DIR` in the `dev.php` configuration file, Change the DIR directory to a different path, such as `'/tmp'`.

### Start the project

```bash
cd /var/www/project
php easyswoole.php server start
# php easyswoole server start # When the EasySwoole framework version in your project is less than 3.7.1.
```

Next, you can see your installed project in `/var/www/project`. Since EasySwoole is a persistent CLI framework, when you have modified your code, you should terminate the running process instance with `CTRL + C` and re-execute the `php easyswoole server start` start startup command to restart your server and reload the code.

## Supported tags and respective Dockerfile links

tag format:

-   7.4: php version, support 7.3/7.4/8.1/8.2, Recommend 7.4
-   3.12: alpine version, support alpine 3.12/3.15/3.16/3.18, recommend 3.15
-   4.4.26: swoole version

support:

### php 7.3.33

-   [`php7.3.33-alpine3.12-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.3.33/alpine/3.12/base/Dockerfile)
-   [`php7.3.33-alpine3.12-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/Dockerfile), [`php7.3.33-alpine3.12-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/4.4.26/Dockerfile)

### php 7.4.33

-   [`php7.4.33-alpine3.15-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/base/Dockerfile)
-   [`php7.4.33-alpine3.15-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/Dockerfile), [`php7.4.33-alpine3.15-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/4.4.26/Dockerfile)

### php 8.1.22

-   [`php8.1.22-alpine3.16-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/base/Dockerfile)
-   [`php8.1.22-alpine3.16-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/Dockerfile), [`php8.1.22-alpine3.16-swoole5.0.3`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/5.0.3/Dockerfile)

### php 8.2.8

-   [`php8.2.8-alpine3.18-base`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php8/8.2.8/alpine/3.18/base/Dockerfile)
-   [`php8.2.8-alpine3.18-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/Dockerfile), [`php8.2.8-alpine3.18-swoole4.8.13`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/4.8.13/Dockerfile), [`php8.2.8-alpine3.18-swoole5.1.1`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/5.1.1/Dockerfile)

### php 8.2.14

-   [`php8.2.14-alpine3.19-base`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php8/8.2.14/alpine/3.19/base/Dockerfile)
-   [`php8.2.14-alpine3.19-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.14/alpine/3.19/swoole/Dockerfile), [`php8.2.14-alpine3.19-swoole4.8.13`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.14/alpine/3.19/swoole/4.8.13/Dockerfile), [`php8.2.14-alpine3.19-swoole5.1.1`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.14/alpine/3.19/swoole/5.1.1/Dockerfile)



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
mongodb
mysqli
mysqlnd
openssl
pcntl
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
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
```
