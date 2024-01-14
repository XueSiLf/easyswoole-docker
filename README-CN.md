[English](./README.md) | 中文

# easyswoole-docker

## Docker 下开发

假设您的本机环境并不能达到 `EasySwoole` 的环境要求，或对于环境配置不是那么熟悉，那么您可以通过以下方法来运行及开发 `EasySwoole` 项目：

- 启动容器

可以根据实际情况，映射到宿主机对应的目录，以下以 `/workspace/project` 为例

> 如果 `docker` 启动时开启了 `selinux-enabled` 选项，容器内访问宿主机资源就会受限，所以启动容器时可以增加 `--privileged -u root` 选项

```bash
docker run --name easyswoole \
-v /workspace/project:/var/www/project \
-p 9501:9501 -it \
--privileged -u root \
--entrypoint /bin/sh \
easyswoolexuesi2021/easyswoole:php8.1.22-alpine3.16-swoole4.8.13
```

你可以选择公共镜像： `easyswoolexuesi2021/easyswoole:php7.3.33-alpine3.12-swoole4.4.26`， `easyswoolexuesi2021/easyswoole:php7.4.33-alpine3.15-swoole4.4.26`， `easyswoolexuesi2021/easyswoole:php8.1.22-alpine3.16-swoole4.8.13`， `easyswoolexuesi2021/easyswoole:php8.2.8-alpine3.18-swoole5.0.3`。

- 创建项目

```bash
cd /var/www/project
composer require easyswoole/easyswoole
php vendor/bin/easyswoole.php install
# php vendor/bin/easyswoole install # 当你项目中的 EasySwoole 框架本不能低于 3.7.1 时
```

> 注意，在部分环境下，例如 `Win10` 系统的 `docker` 环境。
不可把虚拟机共享目录作为 `EasySwoole` 的 `Temp` 目录，将会因为权限不足无法创建 `socket`。这将产生报错：`listen xxxxxx.sock fail`， 为此可以手动在 `dev.php` 配置文件里把 `Temp` 目录（`TEMP_DIR`配置项）改为其他路径即可，如：`'/tmp'`。

- 启动项目

```bash
cd /var/www/project
php easyswoole.php server start
# php easyswoole server start # 当你项目中的 EasySwoole 框架本不能低于 3.7.1 时
```

接下来，就可以在宿主机 `/var/www/project` 中看到您安装好的代码了。 由于 `EasySwoole` 是持久化的 CLI 框架，当您修改完您的代码后，通过 `CTRL + C` 终止当前启动的进程实例，并重新执行 `php easyswoole server start` 启动命令即可。

## 支持的标签和独立的 Dockerfile 文件链接

标签格式:

-   7.4: php 版本，支持 7.3/7.4/8.1/8.2，建议 7.4
-   3.12: alpine 系统版本，支持 alpine 3.12/3.15/3.16/3.18，建议 3.15
-   4.4.26: php swoole 扩展版本

支持的 `Dockerfile` 文件链接:

-   [`php7.3.33-alpine3.12-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.3.33/alpine/3.12/base/Dockerfile)
-   [`php7.3.33-alpine3.12-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/Dockerfile)，[`php7.3.33-alpine3.12-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php7/7.3.33/alpine/3.12/swoole/4.4.26/Dockerfile)

-   [`php7.4.33-alpine3.15-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.3.33/alpine/3.15/base/Dockerfile)
-   [`php7.4.33-alpine3.15-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/Dockerfile)，[`php7.4.33-alpine3.15-swoole4.4.26`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php7/7.4.33/alpine/3.15/swoole/4.4.26/Dockerfile)

-   [`php8.1.22-alpine3.16-base`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/base/Dockerfile)
-   [`php8.1.22-alpine3.16-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/Dockerfile)，[`php8.1.22-alpine3.16-swoole5.0.3`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.1.22/alpine/3.16/swoole/5.0.3/Dockerfile)

-   [`php8.2.8-alpine3.18-base`](https://github.com/XueSiLf/easyswoole-docker/tree/main/dockerfiles/php8/8.2.8/alpine/3.18/base/Dockefile)
-   [`php8.2.8-alpine3.18-swoole-*`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/Dockerfile)，[`php8.2.8-alpine3.18-swoole5.0.3`](https://github.com/XueSiLf/easyswoole-docker/blob/main/dockerfiles/php8/8.2.8/alpine/3.18/swoole/5.0.3/Dockerfile)



## 快速查看

-   [easyswoole](https://github.com/easy-swoole)
-   [easyswoole 文档](https://www.easyswoole.com/)

## 如何使用这个镜像

添加 [Dockerfile](https://github.com/XueSiLf/easyswoole-docker/blob/main/Dockerfile) 到你的项目中即可。

## 镜像详情

基础镜像包含如下扩展：

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
