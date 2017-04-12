#!/bin/bash

CREATION_SCRIPT=$1
NAME=$2

# First create the container
cd install/lxc/

sed -i 's/sleep 5/sleep 10/g' $CREATION_SCRIPT

sudo ./$CREATION_SCRIPT $NAME --create

# Give oneadmin sudo rights
sudo lxc-attach -n $NAME -- sudo adduser oneadmin sudo
sudo lxc-attach -n $NAME -- sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
