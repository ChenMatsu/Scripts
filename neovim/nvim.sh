#!/bin/bash

OS=$(uname)

if [ "$OS" = "Darwin" ] || [ "$OS" = "Linux" ]; then
    brew install neovim

    # Install Plugin Manager: Lazyvim
    git clone https://github.com/LazyVim/starter ~/.config/nvim
else
    echo "Unsupported OS"
fi

