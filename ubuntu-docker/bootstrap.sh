#!/bin/bash

echo "Docker Bootstrap Script for Ubuntu"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get remove -y docker docker.io containerd runc docker-compose
sudo apt-get install -y nano wget curl git zip unzip python3 python3-pip apt-transport-https ca-certificates curl software-properties-common

echo "Installing Docker"
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker vagrant
sudo groups vagrant

docker --version

echo "Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Complete"
