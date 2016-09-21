FROM grycap/jenkins:ubuntu14.04-git
MAINTAINER Amanda Calatrava <amcaar#i3m.upv.es>
LABEL version="1.0"
LABEL description="Container used for EC3 testing - http://www.grycap.upv.es/ec3"
RUN apt-get update && apt-get install -y \
    nmap \
    wget \
    sshpass \
    python-ply \
    python-dev \
    python-yaml \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
