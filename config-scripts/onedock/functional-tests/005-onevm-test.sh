# Create a vm
sudo lxc-attach -n onetest -- onevm create --memory 512 --cpu 1 --disk ubuntu --nic private --net_context

# Check pending state
while sudo lxc-attach -n onetest -- onevm list | grep "one-0" | awk '{if($5 == "pend"){ exit 0 } else { exit 1 }}'
do
    sleep 2
done
# Wait a little more, until running state
sleep 30

# Check running state
sudo lxc-attach -n onetest -- onevm list | grep "one-0" | awk '{if($5 == "runn"){ exit 0 } else { exit 1 }}'

# Do a ping to check the machine
IP=$(sudo lxc-attach -n onetest -- bash -c 'onevm show -x 0 | /var/lib/one/remotes/datastore/xpath.rb /VM/TEMPLATE/NIC/IP')
sudo lxc-attach -n onetest -- ping -c 3 $IP

# Check the docker containers
sudo lxc-attach -n onetest -- docker ps | grep one-0
# Check the state of the container 
sudo lxc-attach -n onetest -- docker inspect -f '{{.State.Running}}' one-0
# Check the images repository
sudo lxc-attach -n onetest -- docker images | grep "one-0"
# Delete container
sudo lxc-attach -n onetest -- onevm delete 0
