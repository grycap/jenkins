FROM grycap/jenkins:docker
LABEL description="Container to launch im tests"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN  apk add pep8 py-nose --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
