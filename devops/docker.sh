#!/bin/bash

OS=$(uname)

if [ "$OS" == "Darwin" ]; then
    brew install docker docker-compose

    echo "You would need to install Docker Desktop manually!"
    

elif [ "$OS" == "Linux" ]; then
    # Check if docker is already installed
    if !command -v docker &> /dev/null; then
        sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
        sudo rm -rf /var/lib/docker
        sudo rm -rf /etc/docker
    fi

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-lo containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "This script is only supported on Darwin and Linux"
fi

echo "Docker version $(docker --version)"
echo "Docker Compose version $(docker-compose --version)"
echo "Docker and Docker Compose have been installed"
