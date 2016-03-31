FROM gestiweb/minimal:debian-jessie

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i 's|main|main contrib non-free|' /etc/apt/sources.list

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    sudo openssh-server \
    apt-utils aptitude \
    dialog debconf-utils \
    unzip less \
    python python3 \
    wget locales \
    ca-certificates \
    bash \
    ncurses-base \
    vim \
    nano \
    gettext \
    procps \
    build-essential \
    iotop \
    nmap \
    inotify-tools \
    supervisor wget \
    curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
