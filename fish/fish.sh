#!/bin/bash

OS=$(uname) # Get the operating system

# Set up fish
if [ "$OS" == "Darwin" ]; then
    # TODO: Set up termina and fish
    echo "TODO"
elif [ "$OS" == "Linux" ]; then
    sudo apt install fish # Install fish
    sudo fish # Set fish as the default shell
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher # Install fisher

    echo "Fish version $(fish --version) has been installed"
    echo "Fisher version $(fisher --version) has been installed"

    fisher install jethrokuan/z # Install z for fast directory navigation
    fisher install simnalamburt/shellder # Install shellder for shell theme
    
    # sudo apt install peco # Install peco for fuzzy search
    sudo apt install eza # Install eza for ls replacement

    echo "----------Fish Terminal Plugins Installation Completed----------"
else
    echo "This script is only supported on Darwin and Linux"
fi

