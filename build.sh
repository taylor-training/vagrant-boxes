#!/bin/bash

vagrant --version

echo "Building Vagrant base boxes"

echo "Setup building area"

if [ -d "boxes" ]; then
  rm -rf boxes
fi

mkdir boxes

echo "Building Base Ubuntu Vagrant Box"
cd ubuntu-base
vagrant up
vagrant package --output ../boxes/ubuntu-base.box
cd ..
vagrant box remove ubuntu-base
vagrant box add ubuntu-base boxes/ubuntu-base.box

echo "Building Kubernetes Ubuntu Vagrant Box"
cd ubuntu-k8s
vagrant up
vagrant package --output ../boxes/ubuntu-k8s.box
cd ..
vagrant box remove ubuntu-k8s
vagrant box add ubuntu-k8s boxes/ubuntu-k8s.box

echo "Completed building Vagrant base boxes"
