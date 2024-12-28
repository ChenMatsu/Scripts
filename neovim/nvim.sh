#!/bin/bash

OS=$(uname)

if [ "$OS" = "Darwin" ]; then
    brew update
    brew upgrade

    brew install --HEAD neovim luajit tree-sitter

    which nvim
    ln -s $(which nvim) /usr/bin/vim
    which vim

    # Install Vim Plug
    sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
elif [ "$OS" = "Linux" ]; then
    sudo apt update
    sudo apt upgrade

    sudo apt install -y neovim luajit tree-sitter

    which nvim
    ln -s $(which nvim) /usr/local/bin/vim # TODO: check if this is correct
    which vim
else
    echo "Unsupported OS"
fi

