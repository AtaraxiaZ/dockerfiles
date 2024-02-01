#! /bin/bash

rm -r ~/.local/share/nvim/
rm -r ~/.local/state/nvim/
git clone https://github.com/AtaraxiaZ/nvim.git $HOME/.config/nvim
sed -i '/"keaiising\/im-select.nvim"/,/end,/d' $HOME/.config/nvim/lua/plugins/key.lua
sed -i '/"iamcco\/markdown-preview.nvim"/,/end,/d' $HOME/.config/nvim/lua/plugins/text.lua

# You need to install coursier to install Metals
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d >cs
chmod +x cs
./cs setup -y
. ~/.profile
rm ./cs
