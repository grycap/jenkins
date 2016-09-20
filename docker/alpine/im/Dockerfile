FROM grycap/jenkins:docker
LABEL description="Container to launch im tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Add testing repository
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install all the necessary packages
RUN apk add --no-cache \
  py-nose \
  py-boto \
  gcc \
  py-pip \
  ansible \
  procps \
  jq \
  pep8@testing \
  py-coverage@testing \
  py-netaddr@community

RUN pip install scp apache-libcloud soappy mock bottle nose-timer

# Install RADL lib
RUN git clone https://github.com/grycap/RADL /home/jenkins/RADL \
 && cd /home/jenkins/RADL \
 && python setup.py install \
 && rm /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg \
 && mkdir -p /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg \
 && mv * /usr/lib/python2.7/site-packages/RADL-1.0.2-py2.7.egg/

# Install tosca-parser
RUN cd /tmp \
 && git clone --recursive https://github.com/indigo-dc/tosca-parser.git \
 && cd tosca-parser \
 && pip install /tmp/tosca-parser
