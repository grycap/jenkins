FROM grycap/jenkins:ubuntu16.04-python3
LABEL description="Image to run the SCAR tests. (https://github.com/grycap/scar)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN apt-get update && apt-get install -y \
    python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN su jenkins && pip3 install boto3 tabulate

