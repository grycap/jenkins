#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
WORKSPACE=$1
NAME_ID=$2

cd $WORKSPACE/test

# Get the HOST IM container IP
IM_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
# Set IP
sed -i "s/HOSTNAME = \"localhost\"/HOSTNAME = \"$IM_IP\"/g" integration/*.py

cd $WORKSPACE
