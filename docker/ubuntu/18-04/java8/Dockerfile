FROM grycap/jenkins:ubuntu18.04-git
LABEL description="Container with latest version of Java 8"
LABEL maintainer="Miguel Caballer <micafer1@upv.es>"

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    openjdk-8-jdk \
    openjdk-8-jre \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
