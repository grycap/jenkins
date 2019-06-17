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

# install libsodium PHP support
RUN wget https://launchpad.net/~ondrej/+archive/ubuntu/php/+build/14311363/+files/php-sodium_2.0.10-1+ubuntu18.04.1+deb.sury.org+1_amd64.deb && \
    wget https://launchpad.net/~ondrej/+archive/ubuntu/php/+build/16296513/+files/libsodium23_1.0.17-0.1+ubuntu16.04.1+deb.sury.org+1_amd64.deb && \
    dpkg -i *sodium*.deb && \
    rm *sodium*.deb

RUN wget https://phar.phpunit.de/phpunit-6.4.phar && \
    chmod +x phpunit-6.4.phar && \
    mv phpunit-6.4.phar /usr/bin/phpunit

RUN mkdir -p /var/www/.ec3/clusters && chmod 777 /var/www/.ec3/clusters
