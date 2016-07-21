FROM centos:7
LABEL description="Base container image with the jenkins user configured"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN yum -y update && yum install -y \
    sudo \
    rpm-build \
    epel-release \
    wget \
    which \
 && yum clean all

# Add jenkins user/group
RUN groupadd -g 1001 jenkins \
&& useradd -m -d /home/jenkins -s /bin/bash -g jenkins -u 1001 jenkins

RUN gpasswd -a jenkins wheel

# Enable passwordless sudo for users under the "wheel" group
RUN sed -i.bkp -e 's/#\s%wheel.*NOPASSWD.*/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers

# Fix issue: 'sudo: sorry, you must have a tty to run sudo'
RUN sed -i.bkp -e 's/Defaults.*requiretty.*/# Defaults requiretty/g' /etc/sudoers
