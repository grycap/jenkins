#!/bin/bash
LRMS=$1
RECIPE=$2
AUTH_FILE=$3

# Create EC3 cluster
echo "Launching cluster"
cd /opt/ec3
HOST=$(./ec3 launch myjenkinscluster $LRMS $RECIPE -a $AUTH_FILE -u http://servproject.i3m.upv.es:8899 -y \
| grep "IP" | awk 'BEGIN {FS=" "}{print $7}' | awk 'BEGIN {FS="F"}{print $1}' )
echo "Cluster successfully created"

if [ "$HOST" == "" ];then
    echo "Error obtaining front IP"
    echo "Deleting cluster"
    ./ec3 destroy myjenkinscluster -y --force
    exit -1
fi

EC3SSH=$(./ec3 ssh tc --show-only)
SSHPASS=$(echo $EC3SSH | awk '{print $2}')
SSHIP=$(echo $EC3SSH | awk '{print $8}')
sshpass $SSHPASS scp test-slurm.sh $SSHIP:/home/ubuntu
$EC3SSH -l ubuntu "./test-slurm.sh"

echo "Deleting cluster"
./ec3 destroy myjenkinscluster -y --force
echo "Cluster successfully deleted"
exit 0
