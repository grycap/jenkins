#!/bin/bash
NAME=$1
AUTH_FILE=$2
# Set working directory
cd /opt/ec3/
# Launch cluster
./ec3 launch $NAME mesos docker ubuntu14-ramses -a $AUTH_FILE -u http://servproject.i3m.upv.es:8899 -y
# Get cluster IP
HOST_IP=$(./ec3 list | grep $NAME | awk '{print $3}')
# Create marathon task
cat >> mysql.json << EOT
{
  "id": "mysql",
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "mysql",
      "network": "BRIDGE",
      "portMappings": [{
        "containerPort": 3306,
        "servicePort": 8306,
        "protocol": "tcp"
      }]
    }
  },
  "env": {
    "MYSQL_ROOT_PASSWORD": "password"
  },
  "instances": 1,
  "cpus": 0.5,
  "mem": 256
}
EOT
echo 'SENDING MARATHON TASK'
http POST http://$HOST_IP:8080/v2/apps < mysql.json
# Check if task is recieved
http GET http://$HOST_IP:8080/v2/apps?embed=tasks -b | jq '.apps[0].id' | grep mysql
echo 'MARATHON TASK RECEIVED SUCCESFULLY'
# Check if the marathon task is running
TASK_STATE=$(http GET http://$HOST_IP:8080/v2/apps?embed=tasks -b | jq '.apps[0].tasks[0].state' | grep -c RUNNING)
while [[ $TASK_STATE -ne 1 ]]; do
  sleep 20
  TASK_STATE=$(http GET http://$HOST_IP:8080/v2/apps?embed=tasks -b | jq '.apps[0].tasks[0].state' | grep -c RUNNING)
  echo 'WATING FOR MARATHON TASK TO DEPLOY'
done
echo 'MARATHON TASK RUNNING'
# Destroy the cluster
./ec3 destroy $NAME -y
