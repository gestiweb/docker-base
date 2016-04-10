FROM gestiweb/debian-jessie:upgrade

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    php5 \
    php5-fpm \
    php5-gd php5-geoip \
    php5-gnupg php5-imagick \
    php5-imap php5-mcrypt \
    php5-memcache \
    php5-mysql php5-oauth \
    php5-odbc php5-pgsql \
    php5-redis php5-sasl \
    php5-sqlite php5-xcache \
    php5-xdebug php5-xmlrpc \
    php5-xsl ssl-cert \
    && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 22

CMD ["/start_container.sh"]
