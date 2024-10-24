#!/bin/bash

OS=$(uname) # Get the operating system

# Set up fish
if [ "$OS" == "Darwin" ]; then
    brew install fish
    echo "Fish version $(fish --version) has been installed"

    # Set fish as the default shell
    sudo chsh -s /opt/homebrew/bin/fish
    echo "Fish has been set as the default shell"

    fish

    # Install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    echo "Fisher version $(fisher --version) has been installed"

    fisher install jethrokuan/z # Install z for fast directory navigation
    fisher install simnalamburt/shellder # Install shellder for shell theme

    brew install eza
    echo "eza has been installed"
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
else
    echo "This script is only supported on Darwin and Linux"
fi


echo "----------Fish Terminal Plugins Installation Completed----------"
    