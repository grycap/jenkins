FROM grycap/jenkins:ubuntu18.04-git
LABEL description="Container to create python3 packages"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    twine \
    python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install -U setuptools
