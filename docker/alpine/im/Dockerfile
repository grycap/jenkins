FROM grycap/jenkins:docker
LABEL description="Container to launch im tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Add testing repository
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install all the necessary packages
RUN apk add --no-cache \
  py-boto \
  py-mysqldb \
  gcc \
  py-pip \
  ansible \
  procps \
  jq \
  py-pep8 \
  python-dev \
  musl-dev \
  libffi-dev \
  openssl-dev 

RUN pip install nose scp netaddr apache-libcloud mock bottle nose-timer suds azure-mgmt-storage azure-mgmt-compute azure-mgmt-network azure-mgmt-resource azure-mgmt-dns pywinrm pyvmomi azure-storage ssh2-python coverage

# Install RADL lib
RUN git clone https://github.com/grycap/RADL /home/jenkins/RADL \
 && cd /home/jenkins/RADL \
 && python setup.py install > install.out \
 && RADL_PKG=$(cat install.out | grep "Processing RADL-.*" | awk '{print $2}') \
 && rm /usr/lib/python2.7/site-packages/$RADL_PKG \
 && mkdir -p /usr/lib/python2.7/site-packages/$RADL_PKG \
 && mv * /usr/lib/python2.7/site-packages/$RADL_PKG/

# Install tosca-parser
RUN cd /tmp \
 && git clone --recursive https://github.com/indigo-dc/tosca-parser.git \
 && cd tosca-parser \
 && pip install /tmp/tosca-parser
