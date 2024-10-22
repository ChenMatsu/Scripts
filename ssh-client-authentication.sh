#!/bin/bash

OS=$(uname) # Get the operating system
OS_USER=$(whoami) # Get the current user
UbuntuVersion="22.04.1" # Greater than specified version

# Authenticate ssh client

if [ "$OS" == "Linux" ]; then
    if ! command -v ssh &> /dev/null; then
        sudo apt update # Update the package list
        sudo apt install openssh-client # Install ssh client
        
        ssh-keygen -t rsa -b 4096 -C "$OS_USER@research.edu" -f ~/.ssh/id_rsa -N "$OS_USER" # Generate ssh key

        echo "SSH key has been generated"

        echo "Enter the server's ip address: "
        read SERVER_IP
        ssh-copy-id -i ~/.ssh/id_rsa.pub $OS_USER@$SERVER_IP # Copy ssh key to server
    fi
else
    echo "This script is only supported on Linux"
fi
