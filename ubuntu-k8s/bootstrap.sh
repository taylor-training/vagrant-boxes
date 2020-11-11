#!/bin/bash

echo "Kubernetes Bootstrap Script for Ubuntu"

sudo apt-get update -y
sudo apt-get upgrade -y

echo "Disable Swap"
swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo ufw disable

echo "Installing Kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get update -y
sudo apt-get install -y kubeadm kubectl kubelet kubernetes-cni

sudo kubeadm version -o short
sudo kubelet --version
sudo kubectl version --short

echo "Complete"
