#!/bin/bash

# $1 -> Job workspace
# $2 -> Docker image of the O.S. to test

WORKSPACE=$1
SO=$2

cat <<EOT > inv
[all]
localhost ansible_port=1022 ansible_user=root ansible_ssh_pass=Tututu+01
EOT

rm -f $HOME/.ssh/known_hosts

echo "Launch container for SO: $SO"
CONT_ID=$(docker run -p 1022:22 -d $SO /bin/bash -c "zypper -n install which sudo openssh; yum install -y openssh-server python ; apt-get update && apt-get install -y openssh-server python ; mkdir /var/run/sshd ; sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config ; sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config ; sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config; rm -f /etc/ssh/ssh_host_rsa_key* ; ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' ; echo 'root:Tututu+01' | chpasswd ; sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd ;  echo 'RUNNING'; /usr/sbin/sshd -D")

OPEN="0"
while [ $OPEN -eq "0" ]; do
    OPEN=$(docker logs $CONT_ID 2> /dev/null | grep RUNNING | wc -l)
    echo "Container not running. Wait a sec."
    sleep 2
done

ansible-playbook -i inv $WORKSPACE/contextualization/conf-ansible.yml -e IM_HOST=localhost

docker exec -ti $CONT_ID ansible --version
RES=$?
echo "Removing container $CONT_ID"
docker rm -f $CONT_ID

if [ $RES -eq 0 ]; then
    echo "$SO [OK]"
else
    echo "$SO [ERR]"
fi

rm -f inv

exit $RES