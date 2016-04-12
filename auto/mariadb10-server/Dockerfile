FROM gestiweb/debian-jessie:upgrade

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    libmariadb2 \
    maria-doc \
    mariadb-client \
    mariadb-server \
    mariadb-server-10.0 \
    tinyca \
    && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 22

CMD ["/start_container.sh"]
