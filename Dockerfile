FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash bash-completion \
    coreutils \
    findutils \
    gawk \
    grep \
    sed \
    less \
    util-linux \
    procps \
    tzdata \
    file \
    curl \
    wget \
    iproute2 \
    iputils \
    net-tools \
    bind-tools \
    busybox-extras \
    openssh \
    rsync \
    socat \
    openssl \
    ca-certificates \
    sudo \
    shadow \
    nano \
    unzip \
    zip \
    build-base \
    make \
    cmake \
    pkgconfig \
    python3 \
    py3-pip \
    perl \
    git \
    subversion \
    mercurial \
    docker-cli \
    && rm -rf /var/cache/apk/*

RUN echo 'export LS_OPTIONS="--color=auto"' >> /root/.bashrc && \
    echo 'alias ls="ls $LS_OPTIONS"' >> /root/.bashrc && \
    echo 'alias ll="ls $LS_OPTIONS -lAh"' >> /root/.bashrc && \
    echo 'alias grep="grep --color=auto"' >> /root/.bashrc && \
    echo 'PS1="\[\e[1;32m\]\u@\h\[\e[0;37m\]:\[\e[1;34m\]\w\[\e[0m\]\\$ "' >> /root/.bashrc && \
    echo 'if [ -f /etc/profile.d/bash_completion.sh ]; then . /etc/profile.d/bash_completion.sh; fi' >> /root/.bashrc

RUN echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> /root/.bash_profile

SHELL ["/bin/bash", "-c"]

CMD ["bash"]
