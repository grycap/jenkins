FROM grycap/jenkins:ubuntu14.04-maven
LABEL description="Container with VncServer"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    vnc4server
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
