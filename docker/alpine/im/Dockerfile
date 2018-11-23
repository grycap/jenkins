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
  procps \
  jq \
  py-pep8 \
  python-dev \
  musl-dev \
  libffi-dev \
  openssl-dev \
  libssh2-dev \
  make \
  cmake \
  py-pep8

RUN ln -s /usr/bin/pep8-2 /usr/bin/pep8
RUN pip install pip -U
RUN pip install nose scp netaddr apache-libcloud mock bottle nose-timer suds azure-mgmt-storage azure-mgmt-compute azure-mgmt-network azure-mgmt-resource azure-mgmt-dns pywinrm pyvmomi azure-storage radl tosca-parser coverage defusedxml codacy-coverage
RUN pip install ansible

# Install ssh2-python lib
RUN git clone https://github.com/ParallelSSH/ssh2-python
RUN cd ssh2-python && python setup.py install
RUN ln -s /usr/lib/python2.7/site-packages/ssh2_python-*/ssh2/
