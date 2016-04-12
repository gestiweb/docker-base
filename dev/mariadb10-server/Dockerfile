FROM gestiweb/mariadb10-server:upgrade

LABEL com.gestiweb.docker.image-name=mariadb10-server:dev


COPY start_container.sh /start_container.sh

EXPOSE 22

CMD ["/start_container.sh"]
