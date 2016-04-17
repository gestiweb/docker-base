FROM gestiweb/mariadb10-server:upgrade

LABEL com.gestiweb.docker.image-name=mariadb10-server:dev

RUN sed -i 's/bind-address[\t ]*=.*$/bind-address = 0.0.0.0/'  /etc/mysql/my.cnf

COPY start_container.sh /start_container.sh

EXPOSE 22
EXPOSE 3306

CMD ["/start_container.sh"]
