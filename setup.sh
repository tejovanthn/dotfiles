#!/bin/bash

#install git and curl
sudo apt-get install -y git
sudo apt-get install -y curl


#install pip, setuptools, python-dev, virtualenv
curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | sudo python
sudo pip install --upgrade setuptools
sudo apt-get install build-essential python-dev libxml2-dev libxslt-dev
sudo pip install virtualenv

#install heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/tejovanthn/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

