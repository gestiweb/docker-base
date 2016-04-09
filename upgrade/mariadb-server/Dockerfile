FROM gestiweb/auto:mariadb-server

RUN apt-get update -y -qq && \
    aptitude install -y -q2 \
    nmap && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TERM dumb

COPY start_container.sh /start_container.sh

EXPOSE 22
EXPOSE 3306

CMD ["/start_container.sh"]
