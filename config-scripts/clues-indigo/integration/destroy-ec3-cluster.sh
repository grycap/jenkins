#!/bin/bash +x
NAME=$1
# Set working directory
cd /opt/ec3/
# Destroy the cluster
./ec3 destroy $NAME -y
