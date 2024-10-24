#!/bin/bash

echo "------Ruby Installation Started--------"

OS=$(uname)
RUBY_VERSION="3.2.3"

# Check Ruby Manager Installation

if [ "$OS" == "Darwin" ]; then
    # if ! command -v rbenv &> /dev/null; then
        echo "Installing rbenv..."
        brew install rbenv

        echo "Installing Ruby on macOS using rbenv..."
        rbenv install $RUBY_VERSION
        rbenv global $RUBY_VERSION

        # Add rbenv to zsh
        echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
        source ~/.zshrc
    # fi
elif [ "$OS" == "Linux" ]; then
    if ! command -v rbenv &> /dev/null; then
        echo "Installing rbenv..."
        sudo apt update
        sudo apt install rbenv

        echo "Installing Ruby on Linux using rbenv..."
        sudo rbenv install $RUBY_VERSION
        sudo rbenv global $RUBY_VERSION
    fi
else
    echo "Unsupported OS. Please install Ruby manager manually."
    exit 1
fi

rbenv rehash

echo "Ruby manager (rbenv) and Ruby installation completed successfully."
echo "Your [rbenv] version is $(rbenv -v)"
echo "Your [Ruby] version is $(ruby -v)"

echo "------Ruby Installation Completed--------"

echo "Would you like to install Rails? (y/n)"
read install_rails

if [ "$install_rails" == "y" ] || [ "$install_rails" == "Y" ]; then
    ./rails-install.sh
fi