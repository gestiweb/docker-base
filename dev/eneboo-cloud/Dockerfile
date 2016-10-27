FROM ubuntu:16.04
LABEL com.gestiweb.docker.image-name=eneboo-cloud:dev

ENV DEBIAN_FRONTEND noninteractive
############### xvnc / xfce installation
RUN apt-get update && apt-get upgrade -y && apt-get install -y iproute2 supervisor vim nano busybox vnc4server wget && rm -rf /var/lib/apt/

RUN apt-get update && apt-get upgrade -y && apt-get install -y nmap net-tools blackbox python-numpy && rm -rf /var/lib/apt/

ENV HOME /home/eneboo
RUN useradd --create-home --home-dir $HOME eneboo \
&& chown -R eneboo:eneboo $HOME


ENV NO_VNC_HOME /home/eneboo/noVNC
### Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/ConSol/noVNC/archive/consol_1.0.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    &&  wget -qO- https://github.com/kanaka/websockify/archive/v0.7.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v /home/eneboo/noVNC/utils/*.sh


#ENV JAVA_VERSION 8u92
#ENV JAVA_HOME /usr/lib/jvm/java-$JAVA_VERSION

ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1024x768
ENV VNC_PW demopass


# novnc web port
EXPOSE 6901




ADD eneboo-2.4-linux64-quick /opt/eneboo-2.4-linux64-quick
ADD vnc $HOME/.vnc
ADD config $HOME/.config
ADD Desktop $HOME/Desktop
ADD scripts $HOME/scripts
RUN chmod +x $HOME/.vnc/xstartup /etc/X11/xinit/xinitrc $HOME/scripts/*.sh $HOME/Desktop/*.desktop
RUN ln -sf /opt/eneboo-2.4-linux64-quick/bin/eneboo /usr/local/bin/eneboo

RUN chown -R eneboo:eneboo $HOME

USER eneboo

ENTRYPOINT ["/home/eneboo/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
