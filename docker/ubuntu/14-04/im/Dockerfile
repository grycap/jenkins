FROM grycap/jenkins:ubuntu14.04-python
LABEL description="Image to run the IM service. (http://www.grycap.upv.es/im)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN apt-get update && apt-get install -y \
    gcc \
    python-dev \
    python-pip \
    python-suds \
    python-dateutil \
    python-mysqldb \
    python-sqlite \
    openssh-client \
    sshpass \
    git \
    libssl-dev \
    libffi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install CherryPy to enable HTTPS in REST API
RUN pip install setuptools --upgrade -I
RUN pip install pbr CherryPy pyOpenSSL --upgrade -I
