FROM grycap/jenkins:ubuntu18.04-git
LABEL description="Container with python 3 and python test libraries"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-nose \
    python3-mock \
    python3-ply \
    python-tox \
    python3-coverage \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
