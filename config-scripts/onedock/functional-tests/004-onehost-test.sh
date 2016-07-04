# Create one host
sudo lxc-attach -n onetest -- onehost create "ubuntu" -i onedock -v onedock -n dummy
sleep 2

# Check the host creation status
while sudo lxc-attach -n onetest -- onehost list | grep "ubuntu" | awk '{if($7 == "init"){ exit 0 } else { exit 1 }}'
do
    sleep 2
done

# Check that the host has been created sucessfully
sudo lxc-attach -n onetest -- onehost list | grep "ubuntu" | awk '{if($13 == "on"){ exit 0 } else { exit 1 }}'
