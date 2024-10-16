#!/bin/bash bash

sudo apt-get -y install openssh-client openssh-server
mkdir ~/.ssh
touch ~/.ssh/config
ssh-keygen -t ed25519 -C "ddiniz@student.42sp.org.br"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

eval "$(ssh-agent -s)" && ssh-add ~/.ssh/42vogsphere && clear
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github && clear
