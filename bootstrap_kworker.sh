#!/bin/bash

# Join worker nodes to the Kubernetes cluster
echo "[TASK 1] Install additional tools on the worker node"
sudo yum install -y wget
sudo wget https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -ivh epel-release-6-8.noarch.rpm
sudo yum install -q -y sshpass >/dev/null 2>&1
echo "[TASK 2] Join node to Kubernetes Cluster"
sudo sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no masternode.umaitek.dz:/joincluster.sh /joincluster.sh 2>/dev/null
sudo bash /joincluster.sh >/dev/null 2>&1