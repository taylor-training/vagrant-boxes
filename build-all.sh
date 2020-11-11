#!/bin/bash

echo "Building Vagrant base boxes"

./build.sh ubuntu-base
./build.sh ubuntu-docker
./build.sh ubuntu-k8s

echo "Completed building Vagrant base boxes"
