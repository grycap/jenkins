# Dockerfile to create a container with the EC3 service
FROM grycap/jenkins:ubuntu14.04-git
MAINTAINER Amanda Calatrava <amcaar#i3m.upv.es>
LABEL version="1.0"
LABEL description="Elastic Cloud Computing Cluster (EC3) - http://www.grycap.upv.es/ec3"
RUN apt-get update && apt-get install -y \
    nmap \
    wget \
    python-ply \
    python-dev \
    python-yaml \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV EC3_HOME /opt/ec3
RUN mkdir -p "$EC3_HOME"
WORKDIR $EC3_HOME
RUN git clone https://github.com/grycap/ec3.git $EC3_HOME

# Set jenkins user as owner of the ec3 app
RUN sudo chown -R 1001:1001 /opt/
