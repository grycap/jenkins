# Get the docker IP
DOCKER0IP=$(ip addr show dev docker0 | grep 'inet ' | awk '{print $2}' | sed 's/\/.*$//')

# Create test data
sudo lxc-attach -n $NAME -- bash -c "cat > docker-private.net << EOF
NAME=private
BRIDGE=docker0
NETWORK_ADDRESS="$DOCKER0IP"
NETWORK_MASK= "255.255.0.0"
DNS="$DOCKER0IP"
GATEWAY="$DOCKER0IP"
AR=[TYPE = "IP4", IP = "172.17.10.1", SIZE = "100" ]
VN_MAD=dummy
EOF"

# Create private net
sudo lxc-attach -n $NAME -- onevnet create docker-private.net
sleep 2

# Check if the net exists
sudo lxc-attach -n $NAME -- onevnet list | grep private
