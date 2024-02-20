#! /bin/bash

# NVM
curl -o install.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
bash install.sh &&
	. "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} &&
	. "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} &&
	. "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} &&
	rm install.sh

# Neovim
wget https://mirror.ghproxy.com/https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage &&
	mv nvim.appimage nvim

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') &&
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit &&
	sudo install lazygit /usr/local/bin &&
	rm -rf lazygit.tar.gz lazygit

# ctags
wget https://mirror.ghproxy.com/https://github.com/universal-ctags/ctags-nightly-build/releases/download/2023.12.18%2Bd4b20382f6d3894702ea5e58cddb93927e3e4e17/uctags-2023.12.18-linux-x86_64.tar.xz
tar xvf uctags-2023.12.18-linux-x86_64.tar.xz &&
	mv uctags-2023.12.18-linux-x86_64/bin/ctags . &&
	rm -rf uctags*
