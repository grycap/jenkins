FROM grycap/jenkins:ubuntu14.04-python
LABEL description="Container with the python libraries needed to test tosca templates"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python-pbr \
    python-yaml \
    python-dateutil \
    python-fixtures \
    python-testscenarios \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
