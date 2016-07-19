FROM grycap/jenkins:ubuntu14.04-maven
LABEL description="Container with a vnc display configured"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    firefox \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create vnc folders and files
RUN mkdir ~/.vnc \
 && touch ~/.vnc/passwd \
 && x11vnc -storepasswd "fakepwd123" ~/.vnc/passwd
 
# Start vnc display when the container is launched
ADD start_vnc.sh /start_vnc.sh
RUN chmod +x /start_vnc.sh
CMD ["/start_vnc.sh"] 
