FROM webdevops/php-nginx:8.0

RUN ["/bin/rm","/opt/docker/etc/nginx/vhost.common.d/10-php.conf"]

RUN apt-get update && apt-get install -y \
  default-mysql-client \
  nodejs \
  npm
