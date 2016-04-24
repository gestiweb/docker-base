FROM gestiweb/debian-jessie:upgrade

LABEL com.gestiweb.docker.image-name=ansible-server:dev

COPY apt.sources.list     /etc/apt/sources.list
COPY apt.preferences.conf /etc/apt/preferences

RUN apt-get update -y -qq && \
    apt-get dist-upgrade -yqq && apt-get install -yqq \
    software-properties-common git gitk git-gui nano ansible && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
