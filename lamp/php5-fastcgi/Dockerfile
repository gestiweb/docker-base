FROM gestiweb/php5-fastcgi:upgrade
LABEL com.gestiweb.docker.image-name=php5-fastcgi:lamp

RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php5/fpm/php-fpm.conf
RUN sed -i 's/listen =.*/listen = 9000/' /etc/php5/fpm/pool.d/www.conf

COPY start_container.sh /start_container.sh

EXPOSE 9000

CMD ["/start_container.sh"]
