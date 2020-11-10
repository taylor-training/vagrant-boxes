#!/bin/bash

echo "Building Vagrant base boxes"

echo "Setup building area"
if [ -d "boxes" ]; then
  rm -rf boxes
if

mkdir boxes

echo "Building Base Ubuntu Vagrant Box"
cd ubuntu-base
vagrant up
vagrant package --output ../boxes/ubuntu-base.box
cd ..
vagrant box remove ubuntu-base
vagrant box add ubuntu-base boxes/ubuntu-base.box

echo "Completed building Vagrant base boxes"
