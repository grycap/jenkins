#!/bin/bash

# First create the container
cd install/lxc/

sed -i 's/sleep 5/sleep 10/g' create-lxc-one5

sudo ./create-lxc-one5 onetest --create

# Give oneadmin sudo rights
sudo lxc-attach -n onetest -- sudo adduser oneadmin sudo
sudo lxc-attach -n onetest -- sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
