# open nginx;

FROM index.alauda.cn/openadmin/sys_centos

# nginx/nginx-1.9.12.tar.gz


#---------------nginx--------------------------
RUN mkdir /data/server/nginx
RUN mkdir /data/server/nginx/src
RUN mkdir /data/log/nginx
WORKDIR /data/server/nginx

RUN yum install -y vim vim-enhanced wget zip unzip telnet ntsysv compat* apr* nasm* gcc gcc* gcc-c++ ntp make imake cmake automake autoconf zlib zlib-devel glibc glibc-devel glib2 libxml glib2-devel libxml2 libxml2-devel bzip2 bzip2-devel libXpm libXpm-devel libidn libidn-devel libtool libtool-ltdl-devel* libmcrypt libmcrypt-devel libevent-devel libmcrypt* curl curl-devel perl perl-Net-SSLeay pcre pcre-devel ncurses ncurses-devel openssl openssl-devel openldap openldap-devel openldap-clients openldap-servers krb5 krb5-devel e2fsprogs e2fsprogs-devel libjpeg libpng libjpeg-devel libjpeg-6b libjpeg-devel-6b libpng-devel libtiff-devel freetype freetype-devel fontconfig-devel gd gd-devel kernel screen sysstat flex bison nss_ldap pam-devel compat-libstdc++-33
RUN yum install -y gd-devel pcre-devel libcurl-devel

RUN wget -P /data/server/nginx/src http://f.open.com.cn/S/shell/nginx/nginx-1.9.12.tar.gz
RUN tar -zxvf /data/server/nginx/src/nginx-1.9.12.tar.gz -C /data/server/nginx/src
RUN rm -f /data/server/nginx/src/nginx-1.9.12.tar.gz

#fguo COPY ./ngx_image_thumb-master.zip /data/server/nginx/src/nginx-1.9.12/


RUN groupadd nginxgroup
RUN useradd -s /sbin/nologin -g nginxgroup nginxuser

WORKDIR /data/server/nginx/src/nginx-1.9.12
#fguo unzip ngx_image_thumb-master.zip

RUN ./configure --prefix=/data/server/nginx/nginx-1.9.12 \
--user=nginxuser \
--group=nginxgroup \
--with-mail \
--with-mail_ssl_module \
--with-http_ssl_module \
--with-http_flv_module \
--with-http_dav_module \
--with-http_sub_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-pcre \
--with-http_image_filter_module
#fguo --add-module=./nginx-image-master

#--with-http_spdy_module \

RUN make && make install

RUN rm -rf /data/server/nginx/src

RUN ln -s /data/server/nginx/nginx-1.9.12 /data/server/nginx/default

RUN mkdir /data/server/nginx/default/vhost
RUN mkdir /data/server/nginx/default/www
COPY nginx.conf /data/server/nginx/default/conf/
COPY default.conf /data/server/nginx/default/vhost/
COPY index.html /data/server/nginx/default/www/

ENV NGINX_HOME=/data/server/nginx/default
RUN  chmod 777 /data/server/nginx/default/sbin/*
RUN echo "NGINX_HOME=/data/server/nginx/default" >> /etc/profile

ENV PATH=$PATH:$NGINX_HOME/sbin
RUN echo "PATH=$PATH:$NGINX_HOME/sbin" >> /etc/profile


COPY nginx /etc/init.d/
RUN  chmod 777 /etc/init.d/nginx

WORKDIR /data/server/nginx/default


EXPOSE 80 443


CMD ["nginx", "-g", "daemon off;"]