#!/bin/bash

echo "Base Bootstrap Script for Ubuntu"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y nano wget curl git zip unzip python3 python3-pip apt-transport-https ca-certificates curl software-properties-common
