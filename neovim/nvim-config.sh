#! /bin/bash

rm -r ~/.local/share/nvim/
rm -r ~/.local/state/nvim/
git clone https://github.com/AtaraxiaZ/nvim.git /home/$1/.config/nvim
sed '/{ "keiaising\/im-select.nvim"/,/end,/d' /home/$1/.config/nvim/lua/plugins/key.lua
