# Dockerfile to create a container with the EC3 service
FROM ubuntu:14.04
MAINTAINER Amanda Calatrava <amcaar#i3m.upv.es>
LABEL version="1.0"
LABEL description="Elastic Cloud Computing Cluster (EC3) - http://www.grycap.upv.es/ec3"
RUN apt-get update && apt-get install -y \
    git \
    nmap \
    python-ply \
    python-dev \
    python-yaml

ENV EC3_HOME /opt/ec3
RUN mkdir -p "$EC3_HOME"
WORKDIR $EC3_HOME
RUN git clone https://github.com/grycap/ec3.git $EC3_HOME
COPY nmap_test.sh /opt/nmap_test.sh
