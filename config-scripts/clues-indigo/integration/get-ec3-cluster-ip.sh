#!/bin/bash +x
NAME=$1
# Set working directory
cd /opt/ec3/
# Get cluster IP
echo $(./ec3 list | grep $NAME | awk '{print $3}')
