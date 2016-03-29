FROM debian:jessie

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i 's|main|main contrib nonfree|' /etc/apt/sources.list

RUN apt-get update -y -qq && \
      apt-get dist-upgrade -y && apt-get install -yqq \
    libreadline-gplv2-dev \
    libfreetype6 \
    sudo openssh-server \
    apt-utils \
    aptitude \
    dialog \
    debconf-utils \
    tzdata \
    unzip \
    wget \
    ca-certificates \
    bash \
    bash-completion \
    ncurses-base \
    vim \
    nano \
    gettext \
    logrotate \
    procps \
    build-essential \
    iotop \
    nmap \
    ca-certificates inotify-tools \
    pwgen supervisor unrar unzip wget \
    curl && \
    rm -rf /var/lib/apt/lists/* && \
    echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir -p /etc/logrotate.docker.d

ADD rootfs /

CMD ["bash"]
