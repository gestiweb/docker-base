FROM gestiweb/base:debian-jessie

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    apache2 \
    && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
