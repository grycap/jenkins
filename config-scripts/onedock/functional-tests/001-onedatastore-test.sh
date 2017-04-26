# Create test data
NAME=$1

sudo lxc-attach -n $NAME -- bash -c "cat > onedock.ds << EOF
NAME=onedock
DS_MAD=onedock
TM_MAD=onedock
EOF"

# Create data store
sudo lxc-attach -n $NAME -- onedatastore create onedock.ds
sleep 2

# Check results
# Check if there is space reserved for the data store
sudo lxc-attach -n $NAME -- onedatastore list | grep onedock | awk '{if($3 != "0M"){ exit 0 } else { exit 1 }}'

# Check if the data store state is 'on'
sudo lxc-attach -n $NAME -- onedatastore list | grep onedock | awk '{if($10 == "on"){ exit 0 } else { exit 1 }}'
