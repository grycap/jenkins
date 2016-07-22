#!/bin/bash
FILE="aux.txt"
PACKAGES="${@:1}"
TCP_PORTS=(22 80 111 2046 2047 2048 2049 9618 8899 5050 2181 2888 3888 4400 8080 6444 6445 6818 6817 2375 8500 4000 2376 7946 3375 15001 15002 15003 15004 1023 8800)
UDP_PORTS=(111 1023 2046 2047 2048 2049 1194 6444 6445 15001 15002 15003 15004)
OPEN_PORTS=()

# Create EC3 cluster 
echo "Launching cluster"
cd /opt/ec3
HOST=$(./ec3 launch myjenkinscluster $PACKAGES ubuntu14-ramses -a auth.dat -u http://servproject.i3m.upv.es:8899 -y | grep "IP" | awk 'BEGIN {FS=" "}{print $7}' | awk 'BEGIN {FS="F"}{print $1}' )
echo "Cluster successfully created"

if [ "$HOST" == "" ];then
    echo "Error obtaining front IP"
    exit -1
fi

echo "Analyzing open ports"
# Call nmap
nmap --open -n -p1-65535 $HOST | sed -rn 's/^([0-9]+)\/tcp.*open.*/\1/p' | while read port; do echo $port >> $FILE; done

i=0
while read line
do
    OPEN_PORTS[i]="$line"
    #echo "array[$i] = ${array[i]}"
    let i++
done < $FILE

#echo ${OPEN_PORTS[@]}

# Check if open ports are known
for p in ${OPEN_PORTS[@]}; do
    if [[ " ${TCP_PORTS[@]} " =~ " ${p} " ]];then
        echo "Port $p is expectedly open"
        continue
    else
        echo "Warning! Port $p is unexpectedly open!"
        ./ec3 destroy myjenkinscluster -y --force
        exit -1
    fi
done

echo "Deleting cluster"
rm /opt/ec3/$FILE
./ec3 destroy myjenkinscluster -y --force
echo "Cluster successfully deleted"
exit 0
