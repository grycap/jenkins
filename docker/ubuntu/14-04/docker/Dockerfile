FROM grycap/jenkins:ubuntu14.04-base
LABEL description="Container to build and run docker images (not dind)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
 apt-transport-https \
 ca-certificates \
 apparmor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

ADD docker.list /etc/apt/sources.list.d/

RUN apt-get update && apt-get install -y \
 docker-engine \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
