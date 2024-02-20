#! /bin/bash

# To prevent the annoying warning safe.directory
echo -e "[safe]" >$HOME/.gitconfig
echo -e "\tdirectory = *" >>$HOME/.gitconfig
mkdir -p $HOME/.ssh
echo -e "Host github.com" >$HOME/.ssh/config
echo -e "\tHostname ssh.github.com" >>$HOME/.ssh/config
echo -e "\tPort 443" >>$HOME/.ssh/config
echo -e "\tUser git" >>$HOME/.ssh/config
