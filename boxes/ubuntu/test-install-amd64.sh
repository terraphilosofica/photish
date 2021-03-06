#!/bin/bash
set -xeuo pipefail

# install local package
cp /photish/pkg/*amd64.deb ~
sudo dpkg -r photish || true
sudo dpkg -i ~/*amd64.deb
photish version

# uninstall
sudo dpkg -r photish

# install from the apt get repository
echo "deb https://dl.bintray.com/henrylawson/deb all main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F608A664B7DFFFEA
sudo apt-get update && sudo apt-key update

# install package
sudo apt-get install photish:amd64
photish version
