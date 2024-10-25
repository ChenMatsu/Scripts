#!/bin/bash

OS=$(uname)

if [ "$OS" == "Darwin" ]; then
    brew install docker docker-compose

    echo "You would need to install Docker Desktop manually!"
    

elif [ "$OS" == "Linux" ]; then
    # Check if docker is already installed
    if !command -v docker &> /dev/null; then
        sudo apt-get remove docker docker-engine docker.io containerd runc
    fi

    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stale"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo apt-get install docker-compose
else
    echo "This script is only supported on Darwin and Linux"
fi

echo "Docker version $(docker --version)"
echo "Docker Compose version $(docker-compose --version)"
echo "Docker and Docker Compose have been installed"
