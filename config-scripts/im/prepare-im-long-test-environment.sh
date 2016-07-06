#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
# $3 -> Container image name

GITHUB_URL=https://raw.githubusercontent.com/grycap/jenkins/master/config-scripts/im

# Try to stop any other container with the same name
curl -s $GITHUB_URL/stop-and-remove-docker-containers.sh | bash -s $3

# Build docker image and launch container
curl -s $GITHUB_URL/build-and-launch-docker-container.sh | bash -s $1 $2 $3

# Disable IPv6 in test machines
curl -s $GITHUB_URL/disable-ipv6-ansible.sh | bash -s $1

# Configure tests ports
curl -s $GITHUB_URL/configure-ports-long-tests.sh | bash -s $1 $2
