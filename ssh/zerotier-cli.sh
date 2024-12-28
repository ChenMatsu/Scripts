#!/bin/bash

OS=$(uname)

# Install zerotier-cli
if [ "$OS" == "Darwin" ]; then
    brew install zerotier-cli
elif [ "$OS" == "Linux" ]; then
    curl -s https://install.zerotier.com | sudo bash
fi