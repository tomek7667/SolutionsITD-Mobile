FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade && apt-get -y install git curl unzip wget procps
# start:gitmoji setup
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash
RUN apt-get -y install nodejs
RUN npm i -g gitmoji-cli
# end:gitmoji setup

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/vscodespace
WORKDIR /home/vscodespace

ENV PUB_CACHE=/home/vscodespace/.pub_cache
ENV PATH="/home/vscodespace/flutter/bin:$PATH"

RUN git clone https://github.com/flutter/flutter.git --branch 3.7.6 && \
    /home/vscodespace/flutter/bin/flutter config --enable-web

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
