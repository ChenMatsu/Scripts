#!/bin/bash

OS=$(uname)

if [ "$OS" = "Darwin" ] || [ "$OS" = "Linux" ]; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Run these commands in your terminal to add Homebrew to your PATH
    echo >> /home/[username]/.bashrc # change [username] to your username
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/[username]/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # Install Homebrew's dependencies if you have sudo access
    sudo apt-get install build-essential # GCC and other compilation tools
else
    echo "Unsupported OS"
fi