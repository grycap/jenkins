FROM grycap/jenkins:ubuntu14.04-git

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    zip \
    python3 \
    python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
