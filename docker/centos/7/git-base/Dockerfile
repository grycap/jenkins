FROM centos:7
LABEL description="Base container image with git and Jenkins user."
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN yum -y update \
 && yum clean all

RUN yum -y install git \
 && yum -y install sudo \
 && yum clean all

# Add jenkins user/group  
RUN groupadd -g 1001 jenkins \
&& useradd -m -d /home/jenkins -s /bin/bash -g jenkins -u 1001 jenkins

RUN gpasswd -a jenkins wheel

# Enable passwordless sudo for users under the "wheel" group
RUN sed -i.bkp -e 's/#\s%wheel.*NOPASSWD.*/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers

