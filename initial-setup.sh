#!/bin/bash

# Update Installed Packages
sudo apt-get update && sudo apt-get -y upgrade

# Install Some Necessary Packages
sudo apt-get -y install default-jdk unzip make tidy

# Install and Setup Docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc

sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo chmod 666 /var/run/docker.sock

# Install Jenkins and start it
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt-get -y install jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins

systemctl status jenkins


