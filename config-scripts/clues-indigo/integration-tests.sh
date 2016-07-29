#!/bin/bash +x
NAME=$1
AUTH_FILE=$2
# Set working directory
cd /opt/ec3/
# Launch cluster
./ec3 launch $NAME mesos docker ubuntu14-ramses -a $AUTH_FILE -u http://servproject.i3m.upv.es:8899 -y
# Get cluster IP
HOST_IP=$(./ec3 list | grep $NAME | awk '{print $3}')
sleep 5
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
http POST http://$HOST_IP:8080/v2/apps < mysql.json &> /dev/null
echo 'MARATHON TASK SENT'
sleep 5

function get_marathon_tasks() {
  echo $(http GET http://$HOST_IP:8080/v2/apps?embed=tasks -b)
}

echo 'CHECKING IF MARATHON RECEIVES THE TASK'
get_marathon_tasks | jq '.apps[0].id' | grep mysql &> /dev/null
echo 'MARATHON TASK RECEIVED SUCCESFULLY'
sleep 5

function get_marathon_task_state() {
  echo $(get_marathon_tasks | jq '.apps[0].tasks[0].state')
}

echo 'WAITING FOR MARATHON TASK TO DEPLOY'
TASK_STATE=$(get_marathon_task_state | grep -c RUNNING)
while [[ $TASK_STATE -ne 1 ]]; do
  sleep 20
  TASK_STATE=$(get_marathon_task_state | grep -c RUNNING)
  echo 'WAITING FOR MARATHON TASK TO DEPLOY'
done
echo 'MARATHON TASK RUNNING'
# Destroy the cluster
./ec3 destroy $NAME -y
