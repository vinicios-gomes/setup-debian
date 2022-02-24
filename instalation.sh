#!/bin/bash

LINK_DOWNLOAD_VSCODE='https://az764295.vo.msecnd.net/stable/f80445acd5a3dadef24aa209168452a3d97cc326/code_1.64.2-1644445741_amd64.deb'

echo "Update System"

sudo apt-get update -y && sudo apt-get upgrade -y

echo "Installing curl git and wget"
sudo apt install curl git wget
echo "Done"

echo "Download source of the vscode"
wget $LINK_DOWNLOAD_VSCODE
echo "Done"

echo "Installing vscode"
sudo dpkg -i code_1.64.2-1644445741_amd64.deb
echo "Done"

echo "Download and install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "Done"

echo "Installing docker and docker-compose "
sudo apt install docker docker-compose
echo "Done"