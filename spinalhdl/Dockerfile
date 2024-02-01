FROM    ubuntu:22.04

LABEL   maintainer="ataraxialex@gmail.com"
ARG     user=zhe

ENV     DEBIAN_FRONTEND=noninteractive
ENV     TZ=Asia/Shanghai
ENV     TERM=xterm-256color

RUN     adduser --disabled-password --gecos '' $user

RUN     mkdir -p /home/$user/projects /home/$user/opt

RUN     chown -R $user:$user /home/$user/projects /home/$user/opt

WORKDIR /home/$user/opt

RUN apt-get update -y       && \
    apt-get clean all       && \
    apt-get install -y -qq iputils-ping sudo rsync apt-utils x11-utils \
    curl wget xz-utils git vim make gcc g++ zlib1g-dev\
    unzip locales tree openjdk-17-jdk-headless

RUN curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs && \
    chmod +x cs && \
    ./cs setup && \
    . ~/.profile

RUN curl -fLO https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-12-21/oss-cad-suite-linux-x64-20231221.tgz && \
    tar xzf oss-cad-suite-linux-x64-20231221.tgz && \
    . oss-cad-suite-linux-x64-20231221/environment

WORKDIR /home/$user
