FROM ubuntu:16.04
LABEL com.gestiweb.docker.image-name=eneboo-cloud:dev

ENV DEBIAN_FRONTEND noninteractive
############### xvnc / xfce installation
RUN apt-get update && apt-get upgrade -y && apt-get install -y iproute2 supervisor vim nano busybox vnc4server wget nmap net-tools openbox imagemagick python-numpy && rm -rf /var/lib/apt/

ENV HOME /home/eneboo
RUN useradd --create-home --home-dir $HOME eneboo \
&& chown -R eneboo:eneboo $HOME


ENV NO_VNC_HOME /home/eneboo/noVNC


#ENV JAVA_VERSION 8u92
#ENV JAVA_HOME /usr/lib/jvm/java-$JAVA_VERSION

ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1440x768
ENV VNC_PW demopass


# novnc web port
EXPOSE 6901



ADD eneboo-2.4-linux64-quick /opt/eneboo-2.4-linux64-quick
ADD novnc $HOME/noVNC
ADD vnc $HOME/.vnc
ADD qt $HOME/.qt
ADD config $HOME/.config
ADD Desktop $HOME/Desktop
ADD scripts $HOME/scripts
RUN chmod +x $HOME/.vnc/xstartup /etc/X11/xinit/xinitrc $HOME/scripts/*.sh $HOME/Desktop/*.desktop
RUN ln -sf /opt/eneboo-2.4-linux64-quick/bin/eneboo /usr/local/bin/eneboo

RUN cp $HOME/scripts/vnc_auto.html $HOME/noVNC/vnc_auto.html

RUN chown -R eneboo:eneboo $HOME

USER eneboo

ENTRYPOINT ["/home/eneboo/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
# $ENEBOO_CONNSTRING === "$ENEBOO_DBNAME:$ENEBOO_USER:PostgreSQL:$ENEBOO_HOST:$ENEBOO_PORT:$ENEBOO_PASSWD"
