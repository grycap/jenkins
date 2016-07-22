#!/bin/bash
LRMS=$1
AUTH_FILE=$2

# Create EC3 cluster
echo "Launching cluster"
cd /opt/ec3
HOST=$(./ec3 launch myjenkinscluster $LRMS ubuntu14-ramses -a $AUTH_FILE -u http://servproject.i3m.upv.es:8899 -y | grep "IP" | awk 'BEGIN {FS=" "}{print $7}' | awk 'BEGIN {FS="F"}{print $1}' )
echo "Cluster successfully created"

if [ "$HOST" == "" ];then
    echo "Error obtaining front IP"
    echo "Deleting cluster"
    ./ec3 destroy myjenkinscluster -y --force
    exit -1
fi

echo "Deleting cluster"
./ec3 destroy myjenkinscluster -y --force
echo "Cluster successfully deleted"
exit 0
