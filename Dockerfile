#docker build -t niagahoster/boxbilling:latest . && docker rm -f boxbilling && docker container run -d --name boxbilling -p 8004:80 niagahoster/boxbilling:latest && docker start boxbilling

FROM alpine:3.13

# Setup apache and php
RUN apk --update \
    add apache2 \
    nano \
    curl \
    php7 \
    php7-ctype \ 
    php7-simplexml \ 
    php7-xml \ 
    php7-xmlwriter \ 
    php7-dom \ 
    php7-tokenizer \ 
    php7-phar \ 
    php7-apache2 \
    php7-common \
    php7-curl \
    php7-mbstring \
    php7-mysqli \
    php7-pdo_mysql \
    php7-session \
    php7-json \
    php7-gettext \
    && rm -f /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer 

COPY . /var/www/html/

WORKDIR /var/www/html/

RUN composer install

# apache conf
RUN sed -i 's/#ServerAdmin\ you@example.com/ServerAdmin\ you@example.com/' /etc/apache2/httpd.conf && \ 
    sed -i 's/#ServerName\ www.example.com:80/ServerName\ www.example.com:80/' /etc/apache2/httpd.conf && \ 
    sed -i 's#^DocumentRoot ".*#DocumentRoot "/var/www/html"#g' /etc/apache2/httpd.conf && \ 
    sed -i 's#Directory "/var/www/localhost/htdocs"#Directory "/var/www/html"#g' /etc/apache2/httpd.conf && \
    printf "\n<Directory \"/var/www/html\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf && \
# Enable commonly used apache modules
    sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf && \
    sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf && \
    sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf && \
# Modify php.ini settings
    sed -i 's/memory_limit = .*/memory_limit = 256M/' /etc/php7/php.ini && \
    sed -i "s/^;date.timezone =$/date.timezone = \"Asia\/Jakarta\"/" /etc/php7/php.ini

EXPOSE 80

ENTRYPOINT ["httpd","-D","FOREGROUND"]