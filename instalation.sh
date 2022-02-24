#!/bin/bash

LINK_DOWNLOAD_VSCODE='https://az764295.vo.msecnd.net/stable/f80445acd5a3dadef24aa209168452a3d97cc326/code_1.64.2-1644445741_amd64.deb'

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt install curl git wget

wget $LINK_DOWNLOAD_VSCODE

sudo dpkg -i code_1.64.2-1644445741_amd64.deb

