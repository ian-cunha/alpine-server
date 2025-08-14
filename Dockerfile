FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

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
    openrc \
    libc6-compat \
    gcompat \
    musl-locales \
    mandoc \
    man-pages \
    && rm -rf /var/cache/apk/*

RUN echo 'export LS_OPTIONS="--color=auto"' >> /root/.bashrc && \
    echo 'alias ls="ls $LS_OPTIONS"' >> /root/.bashrc && \
    echo 'alias ll="ls $LS_OPTIONS -lAh"' >> /root/.bashrc && \
    echo 'alias grep="grep --color=auto"' >> /root/.bashrc && \
    echo 'PS1="\[\e[1;32m\]\u@\h\[\e[0;37m\]:\[\e[1;34m\]\w\[\e[0m\]\\$ "' >> /root/.bashrc && \
    echo 'if [ -f /etc/profile.d/bash_completion.sh ]; then . /etc/profile.d/bash_completion.sh; fi' >> /root/.bashrc

RUN echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> /root/.bash_profile

RUN echo '#!/bin/bash' > /usr/local/bin/systemctl && \
    echo 'case "$1" in' >> /usr/local/bin/systemctl && \
    echo '  start)    shift; rc-service "$@" start ;;' >> /usr/local/bin/systemctl && \
    echo '  stop)     shift; rc-service "$@" stop ;;' >> /usr/local/bin/systemctl && \
    echo '  restart)  shift; rc-service "$@" restart ;;' >> /usr/local/bin/systemctl && \
    echo '  status)   shift; rc-service "$@" status ;;' >> /usr/local/bin/systemctl && \
    echo '  enable)   shift; rc-update add "$@" boot ;;' >> /usr/local/bin/systemctl && \
    echo '  disable)  shift; rc-update del "$@" boot ;;' >> /usr/local/bin/systemctl && \
    echo '  is-enabled) shift; rc-update show | grep "$@" ;;' >> /usr/local/bin/systemctl && \
    echo '  list-units) rc-status ;;' >> /usr/local/bin/systemctl && \
    echo '  *) rc-service ;;' >> /usr/local/bin/systemctl && \
    echo 'esac' >> /usr/local/bin/systemctl && \
    chmod +x /usr/local/bin/systemctl

RUN echo '#!/bin/bash' > /usr/local/bin/apt && \
    echo 'case "$1" in' >> /usr/local/bin/apt && \
    echo '  update) apk update ;;' >> /usr/local/bin/apt && \
    echo '  upgrade) apk upgrade ;;' >> /usr/local/bin/apt && \
    echo '  install) shift; apk add --no-cache "$@" ;;' >> /usr/local/bin/apt && \
    echo '  remove) shift; apk del "$@" ;;' >> /usr/local/bin/apt && \
    echo '  search) shift; apk search "$@" ;;' >> /usr/local/bin/apt && \
    echo '  *) apk ;;' >> /usr/local/bin/apt && \
    echo 'esac' >> /usr/local/bin/apt && \
    chmod +x /usr/local/bin/apt

SHELL ["/bin/bash", "-c"]

CMD ["bash"]
