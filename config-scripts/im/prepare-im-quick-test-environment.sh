#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
# $3 -> Container image name

# Try to stop any other container with the same name
curl -s https://raw.githubusercontent.com/grycap-jenkins/config-scripts/master/im/stop-and-remove-docker-containers.sh | bash -s $3

# Build docker image and launch container
curl -s https://raw.githubusercontent.com/grycap-jenkins/config-scripts/master/im/build-and-launch-docker-container.sh | bash -s $1 $2 $3

# Disable IPv6 in test machines
curl -s https://raw.githubusercontent.com/grycap-jenkins/config-scripts/master/im/disable-ipv6-ansible.sh | bash -s $1

# Configure tests ports
curl -s https://raw.githubusercontent.com/grycap-jenkins/config-scripts/master/im/configure-ports-quick-tests.sh | bash -s $1 $2
