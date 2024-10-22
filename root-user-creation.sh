#!/bin/bash

OS=$(uname) # Get the operating system
UbuntuVersion="22.04.1" # Greater than specified version

# Create a new user with sudo privileges
if [ "$OS" == "Linux" ]; then
    if [ "$(lsb_release -rs)" -ge "$UbuntuVersion" ]; then
        sudo adduser $USER
        sudo usermod -aG sudo $USER

        echo "Root user has been created"

        su - $USER

        if [ $? -eq 0 ]; then
            echo "Root user has been created and switched to"

            sudo whoami

            git clone https://github.com/ChenMatsu/Scripts.git
        else
            echo "Failed to switch to root user"
        fi
    fi
fi

