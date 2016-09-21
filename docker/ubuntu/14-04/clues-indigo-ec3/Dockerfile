FROM grycap/jenkins:ec3
LABEL description="Container used in the clues-indigo integration testing"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    ssh \
    sshpass \
    jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD clues2.radl /opt/ec3/templates/clues2.radl
ADD ubuntu14-ramses.radl /opt/ec3/templates/ubuntu14-ramses.radl
