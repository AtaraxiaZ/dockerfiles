#! /bin/bash

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xf nvim-linux64.tar.gz && rm nvim-linux64.tar.gz
mv nvim-linux64 $HOME/opt/
ln -s $HOME/opt/nvim-linux64/bin/nvim $HOME/opt/nvim

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
