FROM grycap/jenkins:docker
LABEL description="Container to launch im tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Add testing repository
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install all the necessary packages
RUN apk add --no-cache \
  py3-boto \
  py3-mysqlclient \
  gcc \
  py3-pip \
  procps \
  jq \
  python3-dev \
  musl-dev \
  libffi-dev \
  openssl-dev \
  libssh2-dev \
  make \
  cmake \
  py3-pycodestyle

RUN pip3 install pip -U
RUN pip3 install "cryptography==3.1.1"
RUN pip3 install "pyOpenSSL==19.1.0"
RUN pip3 install nose scp netaddr apache-libcloud mock bottle nose-timer suds-py3 azure-mgmt-storage azure-mgmt-compute azure-mgmt-network azure-mgmt-resource azure-mgmt-dns msrestazure
RUN pip3 install pywinrm pyvmomi radl>=1.1.5 tosca-parser coverage defusedxml codacy-coverage pymongo mysql-connector-python hvac
RUN pip3 install ansible==2.9.15
RUN ln -s /usr/bin/pep8-2 /usr/bin/pep8

# Install ssh2-python lib
#RUN git clone https://github.com/ParallelSSH/ssh2-python
#RUN cd ssh2-python && python3 setup.py install
