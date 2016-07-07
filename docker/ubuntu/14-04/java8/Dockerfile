FROM grycap/jenkins:ubuntu14.04-base
LABEL description="Container with latest version of Maven and Java 8"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Java 8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && add-apt-repository -y ppa:webupd8team/java \
 && apt-get update && apt-get install -y \
    oracle-java8-installer \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/oracle-jdk8-installer
