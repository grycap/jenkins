#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
# $3 -> Container image name
WORKSPACE=$1
NAME_ID=$2
IMAGE_ID=$3

GITHUB_URL=https://raw.githubusercontent.com/grycap/jenkins/master/config-scripts/im

# Build docker image and launch container
curl -s $GITHUB_URL/build-and-launch-im-container.sh | bash -s $WORKSPACE $NAME_ID $IMAGE_ID

# Disable IPv6 in test machines
curl -s $GITHUB_URL/disable-ipv6-ansible.sh | bash -s $WORKSPACE

# Configure tests ports
curl -s $GITHUB_URL/configure-ports.sh | bash -s $NAME_ID $IMAGE_ID
