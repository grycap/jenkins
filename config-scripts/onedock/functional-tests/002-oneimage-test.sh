# Create test data
sudo lxc-attach -n onetest -- bash -c 'cat > ubuntu-docker.tmpl << EOF
NAME="ubuntu"
PATH=docker://ubuntu:latest
TYPE=OS
DESCRIPTION="Ubuntu"
EOF'

# Create the image
sudo lxc-attach -n onetest -- oneimage create -d onedock ubuntu-docker.tmpl
sleep 2

# Check the image creation status
while sudo lxc-attach -n onetest -- oneimage list | grep ubuntu | awk '{if($9 == "lock"){ exit 0 } else { exit 1 }}'
do
    sleep 2
done
# Check that the image is ready (any other state will generate an error)
sudo lxc-attach -n onetest -- oneimage list | grep ubuntu | awk '{if($9 == "rdy"){ exit 0 } else { exit 1 }}'

# Check that the image exists in the repository
sudo lxc-attach -n onetest -- curl -k -X GET https://onetest:5000/v2/_catalog | grep dockerimage
sudo lxc-attach -n onetest -- curl -k -X GET https://onetest:5000/v2/dockerimage/tags/list | grep 0
