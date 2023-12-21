#! /bin/bash

rm -r ~/.local/share/nvim/
rm -r ~/.local/state/nvim/
git clone https://github.com/AtaraxiaZ/nvim.git /home/$1/.config/nvim
sed -i '/"keaiising\/im-select.nvim"/,/end,/d' /home/$1/.config/nvim/lua/plugins/key.lua
sed -i '/"iamcco\/markdown-preview.nvim"/,/end,/d' /home/$1/.config/nvim/lua/plugins/text.lua
