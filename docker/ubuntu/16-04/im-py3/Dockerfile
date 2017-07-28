FROM grycap/jenkins:ubuntu16.04-python3
LABEL description="Image to run the IM service. (http://www.grycap.upv.es/im)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    python3-pip \
    python3-suds \
    python3-dateutil \
    python3-scp \
    python3-requests \
    python3-netaddr \
    python3-yaml \
    python3-ply \
    python3-paramiko \
    python3-boto \
    python3-bottle \
    libmysqld-dev \
    libsqlite3-dev \
    openssh-client \
    sshpass \
    libssl-dev \
    libffi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install cheroot to enable REST API
RUN su jenkins && pip3 install setuptools --upgrade -I
RUN su jenkins && pip3 install pbr pyOpenSSL --upgrade -I
RUN su jenkins && pip3 install cheroot
RUN su jenkins && pip3 install msrest msrestazure azure-common azure-mgmt-storage azure-mgmt-compute azure-mgmt-network azure-mgmt-resource azure-mgmt-dns
RUN su jenkins && pip3 install apache-libcloud
RUN su jenkins && pip3 install ansible
RUN su jenkins && pip3 install PyMySQL
RUN su jenkins && pip3 install pywinrm

# Install tosca-parser master branch
RUN su jenkins && cd /tmp \
 && git clone https://github.com/indigo-dc/tosca-parser  \
 && pip3 install /tmp/tosca-parser

# Install RADL master branch
RUN su jenkins && cd /tmp \
 && git clone https://github.com/grycap/RADL  \
 && pip3 install /tmp/RADL \
# Set access rights to radl folder
 && usermod -G staff -a jenkins \
 && chmod 775 /usr/local/lib/python3.5/dist-packages/radl/
