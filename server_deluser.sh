#!/bin/bash
userid=$1

# deluser in gateway
sudo -S deluser --remove-home $userid

# deluser in other nodes
nodes="master node1 node2"
for node in $nodes; do 
ssh -T -A conmaster@$node << EOF
bash
sudo -S deluser --remove-home $userid
EOF
done
ssh -T -A conmaster@storage << EOF
bash
sudo -S deluser --remove-home $userid
sudo -S rm -rf /data/connectome/$userid
EOF
