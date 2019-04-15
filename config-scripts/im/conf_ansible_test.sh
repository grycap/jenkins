#!/bin/bash

# $1 -> Docker image of the O.S. to test

SO=$1

echo "Launch container for SOf: $SO"
CONT_ID=$(docker run --name confansible -d $SO /bin/bash -c "zypper -n install which sudo openssh; yum install -y sudo openssh-server python ; apt-get update && apt-get install -y sudo openssh-server python ; mkdir /var/run/sshd ; sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config ; sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config ; sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config; rm -f /etc/ssh/ssh_host_rsa_key* ; ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' ; echo 'root:Tututu+01' | chpasswd ; sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd ;  echo 'RUNNING'; /usr/sbin/sshd -D")

OPEN="0"
while [ $OPEN -eq "0" ]; do
    OPEN=$(docker logs $CONT_ID 2> /dev/null | grep RUNNING | wc -l)
    echo "Container not running. Wait a sec."
    sleep 4
done

cat <<EOT > inv
[all]
confansible ansible_port=22 ansible_user=root ansible_ssh_pass=Tututu+01  ansible_ssh_common_args='-o UserKnownHostsFile=/dev/null'
EOT

cat <<EOT > ansible.cfg
[defaults]
host_key_checking = False
nocolor = 1
[paramiko_connection]
record_host_keys=False
EOT

curl -s https://raw.githubusercontent.com/grycap/im/devel/contextualization/conf-ansible.yml > conf-ansible.yml

docker run --rm --link confansible:confansible -v "$PWD/inv:/tmp/inv" -v "$PWD/conf-ansible.yml:/tmp/conf-ansible.yml" -i grycap/im ansible-playbook -i /tmp/inv /tmp/conf-ansible.yml -e IM_HOST=confansible
RES=$?

if [ $RES -eq 0 ]; then
    echo "First attempt finished successfully"
    # Test a reconfigure
    docker run --rm --link confansible:confansible -v "$PWD/inv:/tmp/inv" -v "$PWD/conf-ansible.yml:/tmp/conf-ansible.yml" -i grycap/im ansible-playbook -i /tmp/inv /tmp/conf-ansible.yml -e IM_HOST=confansible
    RES=$?
    if [ $RES -eq 0 ]; then
        echo "Reconfiguration finished successfully"
        docker exec -t $CONT_ID ansible --version
        RES=$?
    fi
fi

echo "Removing container $CONT_ID"
docker rm -f $CONT_ID

if [ $RES -eq 0 ]; then
    echo "$SO [OK]"
else
    echo "$SO [ERR]"
fi

rm -f inv
rm -f ansible.cfg
rm -f conf-ansible.yml

exit $RES
