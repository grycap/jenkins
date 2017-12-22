FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
 && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
 && apt-get install -y nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
