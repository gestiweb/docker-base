FROM gestiweb/auto:debian-jessie-20160408

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    nmap && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
