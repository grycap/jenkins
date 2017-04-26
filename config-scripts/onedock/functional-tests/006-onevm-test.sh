# Create test data
NAME=$1
sudo lxc-attach -n $NAME -- bash -c "cat > /tmp/onedock.vm << EOT
NAME = container-img-second-vm
CPU = 1
MEMORY = 128
DISK = [ IMAGE=ubuntu ]
NIC = [ NETWORK_ID=0 ]
CONTEXT = [ NETWORK = "YES" ]
EOT"

# Create a vm
sudo lxc-attach -n $NAME -- onevm create /tmp/onedock.vm

# Check pending state
while sudo lxc-attach -n $NAME -- onevm list | grep "container-img-s" | awk '{if($5 == "pend"){ exit 0 } else { exit 1 }}'
do
    sleep 2
done
# Wait a little more, until running state
sleep 30

# Check running state
sudo lxc-attach -n $NAME -- onevm list | grep "container-img-s" | awk '{if($5 == "runn"){ exit 0 } else { exit 1 }}'

# Do a ping to check the machine
IP=$(sudo lxc-attach -n $NAME -- bash -c 'onevm show -x 1 | /var/lib/one/remotes/datastore/xpath.rb /VM/TEMPLATE/NIC/IP')
sudo lxc-attach -n $NAME -- ping -c 3 $IP

# Check the docker containers
sudo lxc-attach -n $NAME -- docker ps | grep one-1
# Check the state of the container
sudo lxc-attach -n $NAME -- docker inspect -f '{{.State.Running}}' one-1
# Check the images repository
sudo lxc-attach -n $NAME -- docker images | grep "one-1"
# Delete container
sudo lxc-attach -n $NAME -- onevm delete 1
