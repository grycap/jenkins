FROM grycap/jenkins:ubuntu14.04-git-base
LABEL description="Container used to run selenium tests."
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN apt-get update && apt-get install -y \
    vnc4server \
    maven \
    openjdk-8-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
