FROM gestiweb/apache-server:upgrade
LABEL com.gestiweb.docker.image-name=apache-server:dev

RUN a2enmod actions proxy_fcgi

COPY 001-site.conf /etc/apache2/sites-available
RUN a2dissite 000-default.conf
RUN a2ensite 001-site.conf

COPY start_container.sh /start_container.sh

ADD extra_software/phpmyadmin /var/www/phpmyadmin

EXPOSE 80

CMD ["/start_container.sh"]
