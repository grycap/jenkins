#!/bin/sh -x
# Try to stop any other container with the same name
if sudo lxc-ls -f | grep $1
then
	if sudo lxc-ls -f | grep RUNNING
    then
    	sudo lxc-stop -n $1
    fi
    sudo lxc-destroy -n $1
fi
