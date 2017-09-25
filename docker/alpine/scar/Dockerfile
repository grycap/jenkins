FROM grycap/jenkins:docker
LABEL description="Container to launch SCAR tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Add testing repository
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install all the necessary packages
RUN apk add --no-cache \
  python3

RUN pip3 install boto3 nose tabulate mock coverage

