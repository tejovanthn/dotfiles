#!/bin/bash
cd $HOME


#############################################################
###################  Helper functions  ######################
#############################################################
function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}
#############################################################


#install git
if [ $(program_is_installed git) == 0 ]; then
    sudo apt-get install -y git
else 
    echo "GIT exists, not installing"
fi

#install pip, setuptools, python-dev, virtualenv
if [ $(program_is_installed pip) == 0 ]; then
    curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | sudo python
    sudo pip install --upgrade setuptools
    sudo pip install virtualenv
else 
    echo "PIP exists, not installing"
fi
sudo apt-get install build-essential python-dev libxml2-dev libxslt-dev

#install heroku
if [ $(program_is_installed heroku) == 0 ]; then
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    heroku
else 
    echo "HEROKU exists, not installing"
fi

if [ $(program_is_installed meld) == 0 ]; then
    sudo apt-get install -y meld
else 
    echo "GIT exists, not installing"
fi



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
bash

echo "Done!"
echo "Please go to https://help.github.com/articles/generating-ssh-keys/ to setup github"

#install postgres
if [ $(program_is_installed psql) == 0 ]; then
    sudo apt-get update
    sudo apt-get install postgresql postgresql-contrib
    sudo -u postgres createuser -s $USER
    sudo -u $USER createdb $USER
else
    echo "POSTGRES exists, not installing"
fi
