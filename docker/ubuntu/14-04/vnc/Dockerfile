FROM grycap/jenkins:ubuntu14.04-maven
LABEL description="Container with a vnc display configured"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    vnc4server \
    x11vnc \
    firefox \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install firefox-ESR
RUN wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/45.2.0esr/linux-x86_64/en-US/firefox-45.2.0esr.tar.bz2 \
 && tar -xvjf firefox-45.2.0esr.tar.bz2 -C /opt \
 && mv /usr/bin/firefox /usr/bin/firefox-old \
 && sudo ln -s /opt/firefox/firefox /usr/bin/firefox

# Create vnc folders and files
USER jenkins
RUN mkdir ~/.vnc \
 && touch ~/.vnc/passwd \
 && x11vnc -storepasswd "fakepwd123" ~/.vnc/passwd
USER root

# Start vnc display when the container is launched
ADD start_vnc.sh /start_vnc.sh
RUN chmod +x /start_vnc.sh
ENV DISPLAY :10
CMD ["/start_vnc.sh"] 
