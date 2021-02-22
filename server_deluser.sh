#!/bin/bash
userid=$1
pw=$2

# deluser in gateway
echo $pw | sudo -S deluser --remove-home $userid

# deluser in other nodes
nodes="master node1 node2"
for node in $nodes; do 
sshpass -p $pw ssh -T -A conmaster@$node << EOF
bash
echo $pw | sudo -S deluser --remove-home $userid
EOF
done
sshpass -p $pw ssh -T -A conmaster@storage << EOF
bash
echo $pw | sudo -S deluser --remove-home $userid
echo $pw | sudo -S rm -rf /data/connectome/$userid
EOF
