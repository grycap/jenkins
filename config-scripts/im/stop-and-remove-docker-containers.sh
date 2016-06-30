#!/bin/bash
# Try to stop any other container with the same name as the parameter passed
if docker ps -a | grep $1
then 
    if docker inspect $1 | jq '.[0].State.Status' | awk '{if( $1 = "running" ){ exit 0 } else { exit 1 }}'
    then
    	docker stop $1
    fi
	docker rm $1
# Remove image
docker rmi $1
fi

