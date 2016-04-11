FROM gestiweb/auto:apache-server

LABEL com.gestiweb.docker.image-name=apache-server:upgrade

RUN apt-get update -y -qq && \
    aptitude install -y -q2 \
    nmap netcat inetutils-ftp inetutils-ping inetutils-telnet inetutils-traceroute \
    bind9utils dnsutils \
    && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22
EXPOSE 80

CMD ["/start_container.sh"]
