FROM ubuntu:bionic
LABEL name="Linuxbrew/bionic"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git build-essential  ghostscript=9.22~dfsg+1-0ubuntu1 libgs9=9.22~dfsg+1-0ubuntu1 libgs9-common=9.22~dfsg+1-0ubuntu1 && apt-mark auto libgs9 && apt-mark auto libgs9-common 

RUN gs -v

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

RUN node -v
RUN npm -v

RUN apt-get install -y --no-install-recommends ca-certificates curl file g++ git locales make uuid-runtime \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && localedef -i en_US -f UTF-8 en_US.UTF-8 \
        && useradd -m -s /bin/bash linuxbrew \
        && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers



USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
        SHELL=/bin/bash

RUN git clone https://github.com/Linuxbrew/brew.git /home/linuxbrew/.linuxbrew/Homebrew \
        && mkdir /home/linuxbrew/.linuxbrew/bin \
        && ln -s ../Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/ \
        && brew config


RUN brew install imagemagick poppler ffmpeg 

RUN brew install node@10

RUN brew cleanup -s

RUN convert -version

RUN ffmpeg -version

RUN pdfinfo -v

RUN gs -v

RUN node -v
