FROM gestiweb/debian-jessie:base

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    htop && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
