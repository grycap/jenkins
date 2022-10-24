#!/bin/bash

# $1 -> Docker image of the O.S. to test

SO=$1
CONT_NAME=$(echo "sh_ansible_$1" | tr ':' '_' | tr '/' '_')

curl -s https://raw.githubusercontent.com/grycap/im/devel/contextualization/ansible_install.sh > ansible_install.sh

echo "Launch container for SO: $SO"
CONT_ID=$(docker run --name $CONT_NAME -v "$PWD/ansible_install.sh:/tmp/ansible_install.sh" -d $SO /bin/bash -c "zypper -n install which sudo; yum install -y sudo;  apt-get update && apt-get install -y sudo ; echo 'RUNNING'; sleep 99999999")

OPEN="0"
while [ $OPEN -eq "0" ]; do
    OPEN=$(docker logs $CONT_ID 2> /dev/null | grep RUNNING | wc -l)
    echo "Container not running. Wait a sec."
    sleep 4
done

docker exec -ti $CONT_ID /bin/bash -c "chmod +x /tmp/ansible_install.sh"

docker exec -ti $CONT_ID /bin/bash -c "/tmp/ansible_install.sh /tmp/test.log"

docker exec -t $CONT_ID ansible --version

echo "Removing container $CONT_ID"
docker rm -f $CONT_ID

rm -f ansible_install.sh 

exit $RES
