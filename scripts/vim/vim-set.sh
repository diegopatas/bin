#!/bin/bash bash

# INSTALL VIM

git clone git@github.com:diegopatas/dotfiles.git ~/dotfiles

mv ~/dotfiles/.vimrc ~

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# INSTALL NEOVIM
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i -y nvim-linux64.deb
sudo apt install -y python3-neovim
git clone git@github.com:diegopatas/kickstart.nvim.git ~/.config/nvim
cp ~/.vimrc ~/.config/nvim/init.vim.bkp

