#!/bin/bash

OS=$(uname)

if [ "$OS" == "Darwin" ]; then
    curl -s https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh
    source ~/.zshrc
elif [ "$OS" == "Linux" ]; then
    curl -s https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh

    source ~/.bashrc
else
    echo "This script is only supported on Darwin and Linux"
    exit 1
fi

echo "Miniconda has been installed"
echo "Miniconda version $(conda --version)"