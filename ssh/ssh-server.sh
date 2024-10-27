#!/bin/bash

OS=$(uname) # Get the operating system
UbuntuVersion="22.04.1" # Greater than specified version

if [ "$OS" == "Linux" ]; then
    if command -v ssh &> /dev/null; then
        echo "OpenSSH Server is already installed"
    else
        if [ "$(lsb_release -rs)" -ge "$UbuntuVersion" ]; then
            sudo apt update # Update the package list
            sudo apt install openssh-server # Install ssh server

            sudo systemctl start ssh # Start ssh service
            sudo systemctl enable ssh # Enable ssh service

            echo "OpenSSH Server has been installed and enabled"

            sudo systemctl status ssh # Check ssh service status

            sudo ufw allow ssh # Allow ssh traffic through the firewall
            sudo ufw enable # Enable ufw
            sudo ufw status # Check ufw status
        else
            echo "This script is only supported on Ubuntu greater than $UbuntuVersion"
        fi
    fi
fi





