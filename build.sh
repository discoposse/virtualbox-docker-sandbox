#!/bin/bash

#  build.sh

# Authors: Eric Wright (@DiscoPosse)

export DEBIAN_FRONTEND=noninteractive
echo "set grub-pc/install_devices /dev/sda" | debconf-communicate

sudo apt-get update && sudo apt-get upgrade -y 
sudo apt-get install -y git git-review vim openssh-server

# Set up pre-requisites for Docker install
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-get update 

# Install Docker Engine and start the service
sudo apt-get install -y linux-image-extra-$(uname -r) apparmor docker-engine
sudo service docker start

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Docker Machine
sudo curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > docker-machine
sudo mv docker-machine /usr/local/bin/docker-machine 
sudo chmod +x /usr/local/bin/docker-machine

# Restart for good measure
sudo reboot
