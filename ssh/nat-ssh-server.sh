#!/bin/bash

OS=$(uname) # Get the operating system

# Set up a NAT ssh server
if [ "$OS" == "Linux" ]; then
    # Check local ip address
    hostname -I

    # Find the router's ip address
    ip route | grep default
fi