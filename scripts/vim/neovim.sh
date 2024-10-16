#!/bin/bash bash

# INSTALL NEOVIM
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i -y nvim-linux64.deb
sudo apt install -y python3-neovim
#git clone git@github.com:diegopatas/kickstart.nvim.git ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp ~/.vimrc ~/.config/nvim/init.vim.bkp
