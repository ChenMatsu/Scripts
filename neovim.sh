#!/bin/bash

OS=$(uname)

# Install neovim
if [ "$OS" == "Darwin" ]; then
    echo "Installing neovim on macOS"

    if ! neovim --version &>/dev/null; then
        brew install neovim
    fi

elif [ "$OS" == "Linux" ]; then
    echo "Installing neovim on Linux"

    if ! neovim --version &>/dev/null; then
        sudo apt install neovim
    fi
fi

echo "Neovim has been installed"
