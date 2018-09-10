FROM grycap/jenkins:docker
LABEL description="Container to launch tosca-parser tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apk add \
  py-pip \
  python-dev \
  gcc \
  g++ \ 
  libffi-dev \
  openssl-dev \ 
  --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN pip install tox
