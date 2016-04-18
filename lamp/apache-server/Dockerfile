FROM gestiweb/apache-server:upgrade
LABEL com.gestiweb.docker.image-name=apache-server:lamp

RUN a2enmod actions proxy_fcgi

COPY 001-site.conf /etc/apache2/sites-available
RUN a2dissite 000-default.conf
RUN a2ensite 001-site.conf

COPY start_container.sh /start_container.sh
COPY configure_container.sh /configure_container.sh

ADD extra_software/phpmyadmin /var/www/html/phpmyadmin
COPY config/phpmyadmin/config.inc.php /var/www/html/phpmyadmin

RUN /configure_container.sh

EXPOSE 80

CMD ["/start_container.sh"]
