FROM grycap/jenkins:ubuntu16.04-git
LABEL description="Container with the latest version of PHPUnit"
LABEL maintainer="Miguel Caballer <micafer1@upv.es>"

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y wget \
    php \
    php-xdebug \
    php-curl \
    php-sqlite3 \
    php-xml \
    php-mbstring \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://phar.phpunit.de/phpunit-6.4.phar && \
    chmod +x phpunit-6.4.phar && \
    mv phpunit-6.4.phar /usr/bin/phpunit

RUN mkdir -p /var/www/.ec3/clusters && chmod 777 /var/www/.ec3/clusters
