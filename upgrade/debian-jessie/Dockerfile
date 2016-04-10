FROM gestiweb/auto:debian-jessie

LABEL com.gestiweb.docker.image-name=debian-jessie:upgrade

RUN apt-get update -y -qq && \
    aptitude install -y -q2 \
    nmap && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TERM xterm

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
