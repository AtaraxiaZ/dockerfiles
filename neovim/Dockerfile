FROM    ubuntu:22.04

LABEL   maintainer="ataraxialex@gmail.com"
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

ENV     PATH="/home/${user}/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
ENV     PATH="/home/${user}/opt:${PATH}"
ENV     PATH="/home/${user}/.cargo/bin:${PATH}"

COPY --chown=${user}:${user} repositories /home/${user}/.sbt/

COPY --chown=${user}:${user} cargo-config.sh .
COPY --chown=${user}:${user} git-config.sh .
COPY --chown=${user}:${user} npm-config.sh .
COPY --chown=${user}:${user} nvim-config.sh .
COPY --chown=${user}:${user} python-config.sh .
COPY --chown=${user}:${user} shell-config.sh .
COPY --chown=${user}:${user} software-config.sh .

RUN chmod +x *.sh
RUN ./cargo-config.sh && \
    rm cargo-config.sh
RUN ./git-config.sh && \
    rm git-config.sh
RUN ./npm-config.sh && \
    rm npm-config.sh
RUN ./nvim-config.sh && \
    rm nvim-config.sh
RUN ./python-config.sh && \
    rm python-config.sh
RUN ./shell-config.sh && \
    rm shell-config.sh
RUN ./software-config.sh && \
    rm software-config.sh

WORKDIR /home/${user}

CMD source /home/${user}/.bashrc
