#!/bin/sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo -s
sh get-docker.sh
usermod -aG docker ubuntu
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
apt-get update -y && apt-get install git -y
