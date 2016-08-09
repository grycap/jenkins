#!/bin/bash
# $1 -> Container name
# $2 -> Container image name
NAME_ID=$1
IMAGE_ID=$2

# Try to stop any other container with the same name as the parameter passed
if docker ps -a | grep $NAME_ID
then
    if docker inspect $NAME_ID | jq '.[0].State.Status' | awk '{if( $1 = "running" ){ exit 0 } else { exit 1 }}'
    then
    	docker stop $NAME_ID
    fi
	docker rm $NAME_ID
# Remove image
docker rmi $IMAGE_ID
fi
