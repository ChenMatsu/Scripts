#!/bin/bash

echo "------Rails Installation Started--------"

echo "Update gem for Rails installation"
gem update --system

echo "Installing Rails using gem"
gem install rails

echo "Would you like to install SQLite3? (y/n)"
read install_sqlite3

if [ "$install_sqlite3" == "y" ] || [ "$install_sqlite3" == "Y" ]; then
    if ! command -v sqlite3 &> /dev/null; then
        echo "Installing SQLite3"
        gem install sqlite3
        echo "Your [SQLite3] version is $(sqlite3 --version)"
    fi
fi

echo "Your [gem] version is $(gem -v)"
echo "Your [Rails] version is $(rails -v)"


echo "------Rails Installation Completed--------"