#!/bin/bash

# Common ressources
DIALOG_TITLE="Git configuration"

# Global git configuration
git config --global gui.encoding utf-8
git config --global core.quotepath off
git config --global credential.helper cache
name=$(git config --global user.name)
name=$(zenity --title "$DIALOG_TITLE" --entry --text "Please enter your name:" --entry-text "$name")
if [ ! -z "$name" ]; then
	git config --global user.name "$name"
fi
email=$(git config --global user.email)
email=$(zenity --title "$DIALOG_TITLE" --entry --text "Please enter your eMail address:" --entry-text "$email")
if [ ! -z "$email" ]; then
	git config --global user.email "$email"
fi

# Install LFS
zenity --title "$DIALOG_TITLE" --question --text "Do you want to install LFS (this only works on Debian and other apt-based distributions)?"
if [ "$?" -eq "0" ]; then
	wget https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
	sudo os=debian dist=stretch bash ./script.deb.sh
	rm ./script.deb.sh
	sudo apt-get update && sudo apt-get install git-lfs
	git lfs install
fi

# Done
exit 0
