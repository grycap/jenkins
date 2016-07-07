FROM grycap/jenkins:ubuntu14.04-python
LABEL description="Container used in the clues-indigo testing"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    python-ply \
    python-yaml \
    htcondor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install cpyutils
RUN git clone https://github.com/grycap/cpyutils.git /tmp/cpyutils \
 && cd /tmp/cpyutils \
 && python setup.py install

# Install clues
RUN git clone https://github.com/grycap/clues.git /tmp/clues \
 && cd /tmp/clues \
 && python setup.py install
