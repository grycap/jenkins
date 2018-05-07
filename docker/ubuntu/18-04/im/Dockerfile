FROM grycap/jenkins:ubuntu18.04-python
LABEL description="Image to run the IM service. (http://www.grycap.upv.es/im)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN apt-get update && apt-get install -y \
    gcc \
    python-dev \
    python-pip \
    python-suds \
    python-dateutil \
    libmysqld-dev \
    python-pysqlite2 \
    openssh-client \
    sshpass \
    libssl-dev \
    libffi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install cheroot to enable REST API
RUN pip install setuptools --upgrade -I
RUN pip install pbr pyOpenSSL --upgrade -I
RUN pip install cheroot
RUN pip install pywinrm

# Install RADL master branch
RUN cd /tmp \
 && git clone https://github.com/grycap/RADL  \
 && cd RADL \
 && pip install /tmp/RADL
