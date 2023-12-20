FROM    ubuntu:22.04

LABEL   maintainer="ataraxialex@gmail.com"
ARG     user=zhe

ENV     DEBIAN_FRONTEND=noninteractive
ENV     TZ=Asia/Shanghai
ENV     TERM=xterm-256color
# To run Appimage without fuse support
ENV     APPIMAGE_EXTRACT_AND_RUN=1
ENV     NODE_VERSION=16.13.0
ENV     NVM_DIR=/home/${user}/.nvm

RUN     adduser --disabled-password --gecos '' $user

RUN     mkdir -p /home/$user/projects /home/$user/opt

RUN     chown -R $user:$user /home/$user/projects /home/$user/opt

WORKDIR /home/$user/opt

COPY    nvim-config.sh .
COPY    python-config.sh .

RUN apt-get update -y       && \
    apt-get clean all       && \
    apt-get install -y -qq iputils-ping sudo rsync apt-utils x11-utils \
    curl wget xz-utils git vim build-essential fd-find ripgrep \
    xclip unzip python3-pip locales tree

RUN     ln -fs /bin/bash /bin/sh

RUN     echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER    $user

ENV     PATH="/home/${user}/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
ENV     PATH="/home/${user}/opt:${PATH}"

RUN curl -o install.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
RUN bash install.sh && \
    . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} && \
    . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} && \
    . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} && \
    rm install.sh

RUN pip install cocotb pandas numpy

RUN npm install -g tldr

RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage && \
    mv nvim.appimage nvim

RUN wget https://github.com/universal-ctags/ctags-nightly-build/releases/download/2023.12.18%2Bd4b20382f6d3894702ea5e58cddb93927e3e4e17/uctags-2023.12.18-linux-x86_64.tar.xz 
RUN tar xvf uctags-2023.12.18-linux-x86_64.tar.xz && \
    mv uctags-2023.12.18-linux-x86_64/bin/ctags . && \
    rm -rf uctags*

RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
RUN tar xf lazygit.tar.gz lazygit && \
    sudo install lazygit /usr/local/bin && \
    rm -rf lazygit.tar.gz lazygit

RUN ./nvim-config.sh $user
