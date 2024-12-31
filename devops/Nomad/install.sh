#!/bin/bash

OS=$(uname)

if [ "$OS" == "Darwin" ]; then
  brew install nomad
elif [ "$OS" == "Linux" ]; then
  wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install nomad
else
  echo "Unsupported OS: $OS"
  exit 1
fi