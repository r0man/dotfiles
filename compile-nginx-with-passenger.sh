#!/bin/sh

NGINX_SRC_URL="http://nginx.org/download/nginx-0.7.65.tar.gz"
NGINX_SRC_DIR="/tmp/`basename "${NGINX_SRC_URL%.*.*}"`"

if [ ! -d $NGINX_SRC_DIR ]; then
    curl $NGINX_SRC_URL | gzip -d | tar xv -C `dirname $NGINX_SRC_DIR` 
fi

passenger-install-nginx-module \
    --auto \
    --prefix="/usr/local/nginx" \
    --nginx-source-dir=$NGINX_SRC_DIR \
    --extra-configure-flags="--conf-path=/etc/nginx/nginx.conf \
 --error-log-path=/var/log/nginx/error.log \
 --pid-path=/var/run/nginx.pid \
 --lock-path=/var/lock/nginx.lock \
 --http-log-path=/var/log/nginx/access.log \
 --http-client-body-temp-path=/var/lib/nginx/body \
 --http-proxy-temp-path=/var/lib/nginx/proxy \
 --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
 --with-debug \
 --with-http_stub_status_module \
 --with-http_flv_module \
 --with-http_ssl_module \
 --with-http_dav_module \
 --with-http_gzip_static_module \
 --with-http_realip_module \
 --with-mail \
 --with-mail_ssl_module \
 --with-ipv6"

