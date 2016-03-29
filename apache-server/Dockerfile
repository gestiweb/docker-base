FROM gestiweb/base:debian-jessie

MAINTAINER David Martinez Marti (Gestiweb) "desarrollo@gestiweb.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -yqq \
    apache2 \
    python34-minimal \
    gamin \
    apachetop \
    python34 \
    python3-minimal \
    python3 \
    dh-python \
    geoip-database \
    libapache2-mod-encoding \
    libapache2-mod-evasive \
    libapache2-mod-fcgid \
    libapache2-mod-geoip \
    libapache2-mod-log-slow \
    libapache2-mod-mime-xattr \
    libapache2-mod-removeip \
    libapache2-mod-security2 \
    libapache2-mod-upload-progress \
    libapache2-mod-wsgi-py3 \
    libfcgi0ldbl \
    uwsgi-core \
    apache2-suexec-custom \
    libapache2-mod-auth-plain \
    libapache2-mod-bw \
    libapache2-mod-defensible \
    libapache2-mod-qos \
    libshibsp-plugins \
    shibboleth-sp2-utils \
    libapache2-mod-shib2 \
    libapache2-mod-uwsgi \
    libapache2-mod-xsendfile \
    modsecurity-crs \
    && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
