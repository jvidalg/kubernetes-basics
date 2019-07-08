#!/bin/bash

# ################################################### 
# Baseline for K8S master and nodes 
# Disables selinux, enables cluster communication, 
# installs docker, kubernetes and enables services.
# ################################################### 

sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
#Enable the br_netfilter module for cluster communication.
sudo modprobe br_netfilter
sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
#Ensure that the Docker dependencies are satisfied.
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
#Add the Docker repo and install Docker.
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce

#Set the cgroup driver for Docker to systemd, then reload systemd, enable and start Docker
sudo sed -i '/^ExecStart/ s/$/ --exec-opt native.cgroupdriver=systemd/' /usr/lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl enable docker --now

#Add the repo for Kubernetes.
sudo cat << EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

#Install k8s
sudo yum install -y kubelet kubeadm kubectl
#Enable k8s
sudo systemctl enable kubelet