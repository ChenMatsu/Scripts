#!/bin/bash

OS=$(uname) # Get the operating system

# Set up fish
if [ "$OS" == "Darwin" ]; then
    # TODO: Set up termina and fish
elif [ "$OS" == "Linux" ]; then
    sudo apt install fish # Install fish
    sudo fish # Set fish as the default shell
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher # Install fisher

    echo "Fish version $(fish --version) has been installed"
    echo "Fisher version $(fisher --version) has been installed"

    fisher install jethrokuan/z # Install z for fast directory navigation
else
    echo "This script is only supported on Darwin and Linux"
fi

