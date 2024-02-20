#! /bin/bash

git clone --depth 1 https://github.com/AtaraxiaZ/nvim.git $HOME/.config/nvim
sed -i '/"keaising\/im-select.nvim"/,/end,/d' $HOME/.config/nvim/lua/plugins/key.lua
sed -i '/"iamcco\/markdown-preview.nvim"/,/end,/d' $HOME/.config/nvim/lua/plugins/text.lua

# You need to install coursier to install Metals
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d >cs
chmod +x cs
./cs setup -y
./cs install bloop --only-prebuilt=true
rm ./cs

# run sbt in a SpinalHDL project to download dependencies
git clone https://github.com/AtaraxiaZ/SpinalTemplateSbt.git /tmp/SpinalTemplateSbt
cd SpinalTemplateSbt && sbt update
rm -rf /tmp/SpinalTemplateSbt
