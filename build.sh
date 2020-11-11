#!/bin/bash

dirname=$1

vagrant --version

echo "Setup building area"

if [ ! -d "boxes" ]; then
  mkdir boxes
fi

if [ -f "boxes/$dirname.box" ]; then
  echo "Deleting existing box: boxes/$dirname.box"
  rm -f boxes/$dirname.box
fi

echo "Building Vagrant Box: $dirname"
cd $dirname
vagrant up
vagrant package --output ../boxes/$dirname.box
vagrant destroy -f
cd ..
vagrant box remove $dirname
vagrant box add $dirname boxes/$dirname.box

echo "Completed building Vagrant box: $dirname"
