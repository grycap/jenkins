#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
# $3 -> Container image name

cd $1/docker-devel

# Create image based on 'devel' branch
docker build -t $2 --no-cache -f Dockerfile . 

# Start container
docker run -d -P --name $2 $3

# Wait for the container
sleep 10

cd $1
