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
    libmysqld-dev \
    libsqlite3-dev \
    openssh-client \
    sshpass \
    libssl-dev \
    libffi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install cheroot to enable REST API
RUN pip3 install setuptools --upgrade -I
RUN pip3 install pbr pyOpenSSL --upgrade -I
RUN pip3 install cheroot
