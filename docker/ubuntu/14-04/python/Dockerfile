FROM grycap/jenkins:ubuntu14.04-git
LABEL description="Container with python 2.7 and python test libraries"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python2.7 \
    python-nose \
    python-mock \
    python-ply \
    python-coverage \
    python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install new version of tox tool
RUN pip install tox --upgrade -I
