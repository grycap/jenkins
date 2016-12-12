FROM docker:git
LABEL description="Container to build and run docker images (not dind)"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Add community repository
RUN echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Update and install all the necessary packages
RUN apk add --no-cache \
    sudo \
    curl \
    wget \
    bash \
    shadow@community

# Add jenkins user/group
RUN groupadd -g 1001 jenkins \
 && useradd -m -d /home/jenkins -s /bin/bash -g jenkins -u 1001 jenkins \
 && gpasswd -a jenkins wheel

# Enable jenkins to read/write in tmp folder
RUN chown -R 1001:1001 /tmp

# Enable passwordless sudo for users under the "wheel" group
RUN sed -i.bkp -e 's/#\s%wheel.*NOPASSWD.*/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers

# Fix issue: 'sudo: sorry, you must have a tty to run sudo'
RUN sed -i.bkp -e 's/Defaults.*requiretty.*/# Defaults requiretty/g' /etc/sudoers

# Add jenkins to the docker group
RUN groupadd docker \
 && usermod -aG docker jenkins
