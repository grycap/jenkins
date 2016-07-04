#!/bin/sh -x
# Try to stop any other container with the same name
if sudo lxc-ls -f | grep onetest
then
	if sudo lxc-ls -f | grep RUNNING
    then
    	sudo lxc-stop -n onetest
    fi
    sudo lxc-destroy -n onetest
fi

