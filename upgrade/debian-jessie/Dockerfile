FROM gestiweb/auto:debian-jessie-20160409a

RUN apt-get update -y -qq && \
    aptitude install -y -q2 \
    nmap && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
