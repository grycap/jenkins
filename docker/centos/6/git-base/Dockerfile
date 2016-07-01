FROM centos:6
LABEL description="Base container image with git and Jenkins user."
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the neccesary packages
RUN yum -y update \
 && yum clean all

RUN yum -y install git \
 && yum -y install sudo \
 && yum clean all


# Add jenkins user/group  
RUN groupadd -g 112 devel \
 && useradd -u 105 -g 112 jenkins

RUN gpasswd -a jenkins wheel

# Enable passwordless sudo for users under the "wheel" group
RUN sed -i.bkp -e \
  's/#\s%wheel\sALL=NOPASSWD:ALL/%wheel ALL=NOPASSWD:ALL/g' \
  /etc/sudoers
