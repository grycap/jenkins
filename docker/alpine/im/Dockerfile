FROM grycap/jenkins:docker
LABEL description="Container to launch im tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apk add \
  pep8 \
  py-nose \
  py-coverage \
  py-boto \
  gcc \
  py-pip \
  py-netaddr \
  ansible \
  procps \
  jq \
  --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN pip install scp apache-libcloud soappy mock bottle nose-timer

# Install RADL lib
RUN git clone https://github.com/grycap/RADL /home/jenkins/RADL \
 && cd /home/jenkins/RADL \
 && python setup.py install \
 && rm /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg \
 && mkdir -p /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg \
 && mv * /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg/

# Install tosca-parser
RUN cd tmp \
 && git clone --recursive https://github.com/indigo-dc/tosca-parser.git \
 && cd tosca-parser \
 && pip install /tmp/tosca-parser
