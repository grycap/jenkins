FROM grycap/jenkins:centos7-base
LABEL description="Base container image with git"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN yum -y update && yum install -y \
    git \
 && yum clean all
