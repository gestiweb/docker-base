FROM gestiweb/auto:php5-fastcgi

LABEL com.gestiweb.docker.image-name=php5-fastcgi:upgrade
# phpmyadmin (sin recommends, por apt-get; sino te instala el apache) -> en nueva imagen phpmyadmin-fastcgi
# o tambien, incluir phpmyadmin en esta imagen, y derivarlo a phpmyadmin-fastcgi-dev
RUN apt-get update -y -qq && \
    aptitude install -y -q2 \
    nmap netcat inetutils-ftp inetutils-ping inetutils-telnet inetutils-traceroute \
    bind9utils dnsutils php-tcpdf \
    && \
  apt-get dist-upgrade -yqq && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start_container.sh /start_container.sh

EXPOSE 22
EXPOSE 80

CMD ["/start_container.sh"]
