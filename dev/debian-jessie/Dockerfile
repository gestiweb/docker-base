FROM gestiweb/debian-jessie:upgrade

RUN apt-get update -y -qq && \
    apt-get dist-upgrade -yqq && apt-get install -yqq \
    nmap && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
