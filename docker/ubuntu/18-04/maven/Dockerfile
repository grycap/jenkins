FROM grycap/jenkins:ubuntu18.04-java8
LABEL description="Container with latest version of Maven"
LABEL maintainer="Miguel Caballer <micafer1@upv.es>"

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    maven \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
