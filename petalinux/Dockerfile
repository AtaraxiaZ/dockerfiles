FROM    ubuntu:jammy-20220428

LABEL   maintainer="ataraxialex@gmail.com"

ENV     DEBIAN_FRONTEND=noninteractive
ENV     LC_ALL=en_US.UTF-8 
ENV     LANG=en_US.UTF-8 
ENV     LANGUAGE=en_US.UTF-8 
ENV     TZ=Asia/Shanghai
ENV     TERM=xterm-256color

ARG     version=23.1
ARG     user=plnx

RUN     adduser --disabled-password --gecos '' $user

RUN     mkdir -p /opt/petalinux /home/$user/projects

RUN     chown -R $user:$user /opt/petalinux /home/$user/projects

WORKDIR /home/$user/projects

# using local mirror to speed up
# COPY /etc/apt/sources.list /etc/apt/sources.list
COPY    sources.list /etc/apt/sources.list
COPY    petalinux-v$version.run /home/$user/projects
COPY    noninteractive-install.sh .

RUN dpkg --add-architecture i386    && \
    apt-get update -y       && \
    apt-get clean all       && \
    apt-get install -y -qq iputils-ping sudo rsync apt-utils x11-utils

# Required tools and libraries of Petalinux.
# See in: ug1144-petalinux-tools-reference-guide
RUN apt-get install -y -qq --no-install-recommends bc \
    tofrodos iproute2 gawk python3 xvfb gcc wget build-essential \
    checkinstall libncursesw5-dev libssl-dev less \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev git git-core \
    net-tools libncurses5-dev zlib1g-dev libssl-dev flex bison \
    libselinux1 gnupg diffstat chrpath socat xterm autoconf libtool \
    tar unzip texinfo gcc-multilib libsdl1.2-dev libglib2.0-dev automake \
    screen pax gzip language-pack-en libtool-bin cpio lib32z1 lsb-release \
    zlib1g:i386 vim-common libgtk2.0-dev libstdc++6:i386 libc6:i386 \
    python3-pexpect xz-utils debianutils python3-git python3-jinja2 \
    libegl1-mesa pylint make expect vim
# Using expect to install Petalinux automatically.

# bash is PetaLinux recommended shell
RUN     ln -fs /bin/bash /bin/sh    

RUN     echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER    $user

RUN     echo "source /opt/petalinux/settings.sh" >> ~/.bashrc

RUN ./noninteractive-install.sh /opt/petalinux ${version}       && \
    rm -rf petalinux-v${version}.run                            && \
    rm noninteractive-install.sh *log
