#!/bin/bash +x
NAME=$1
AUTH_FILE=$2
# Set working directory
cd /opt/ec3/
# Launch cluster
./ec3 launch $NAME mesos docker ubuntu14-ramses -a $AUTH_FILE -u http://servproject.i3m.upv.es:8899 -y
