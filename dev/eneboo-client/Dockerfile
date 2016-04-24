FROM gestiweb/debian-jessie:upgrade

LABEL com.gestiweb.docker.image-name=eneboo-client:dev

COPY apt.sources.list     /etc/apt/sources.list
COPY apt.preferences.conf /etc/apt/preferences
COPY apt.sources.x2go.list     /etc/apt/sources.list.d/x2go.list



RUN apt-get update -y -qq && apt-get install x2go-keyring -y --force-yes && apt-get update -y -qq && \
    apt-get dist-upgrade -yqq && apt-get install -yqq \
    software-properties-common git gitk git-gui nano ansible \
    libgcc1 libc6 libuuid1 libice6 libsm6 libstdc++6 libx11-6 libxau6 \
    libxcb1 libxcursor1 libxdmcp6 libxext6 libxfixes3 libxinerama1 libxrender1 zlib1g \
    x11vnc xvfb iceweasel x2goserver fluxbox && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://www.eneboo.org/pub/contrib/2.4.5.1-rc6/eneboo-build-2.4.5.1-rc6-linux64-quick.tar.bz2 && \
    tar jxf eneboo-build-2.4.5.1-rc6-linux64-quick.tar.bz2 && \
    unlink eneboo-build-2.4.5.1-rc6-linux64-quick.tar.bz2 && \
    mv eneboo-build-2.4.5* /opt/

RUN adduser gestiweb --disabled-password -q --gecos ""

RUN ln -s /opt/eneboo-build-2.4.5.1_rc6-linux64-quick/bin/eneboo /usr/local/bin/eneboo

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
