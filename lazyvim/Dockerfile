FROM    ubuntu:22.04

LABEL   maintainer="904016301@qq.com"
ARG     user=zhe

ENV     DEBIAN_FRONTEND=noninteractive
ENV     TZ=Asia/Shanghai
ENV     TERM=xterm-256color
# To run Appimage without fuse support
ENV     APPIMAGE_EXTRACT_AND_RUN=1
ENV     NODE_VERSION=18.18.0
ENV     NVM_DIR=/home/${user}/.nvm

RUN adduser --disabled-password --gecos '' ${user} && \
    mkdir -p /home/${user}/projects /home/${user}/opt && \
    chown -R ${user}:${user} /home/${user}/projects /home/${user}/opt

WORKDIR /home/${user}/opt

RUN apt-get update -y --no-install-recommends && \
    apt-get clean all && \
    apt-get install -y -qq iputils-ping sudo rsync apt-utils x11-utils \
    curl wget xz-utils git vim build-essential fd-find ripgrep xclip \
    unzip python3-pip locales tree cargo python3.10-venv bear \
    openjdk-17-jdk-headless tmux npm

RUN     ln -fs /bin/bash /bin/sh

# You can use `sudo su` to switch to root user
RUN     echo "${user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER    ${user}

COPY --chown=${user}:${user} nvim-config.sh .

RUN chmod +x *.sh
RUN ./nvim-config.sh && \
    rm nvim-config.sh

ENV     PATH="/home/${user}/opt:${PATH}"

WORKDIR /home/${user}
