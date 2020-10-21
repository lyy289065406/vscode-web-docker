# How to use :
# docker build -t expm02/docker-nginx --build-arg domain=demo_domain.com .
# --------------------------------------------------------------------------------

FROM linuxserver/code-server:latest
MAINTAINER EXP

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y zsh git-core && \
    rm -rf /var/lib/apt/lists/*

ADD ./config/.zshrc /root/.zshrc
RUN mkdir -p /home/abc/ && \
    git clone https://github.com/robbyrussell/oh-my-zsh.git /opt/.oh-my-zsh && \
    chsh -s /bin/zsh

RUN echo "abc ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/abc

EXPOSE 8443
WORKDIR /config/
