#!/bin/bash

cd "${0%/*}"


test -d novnc && rm novnc -Rf

### Install noVNC - HTML5 based VNC viewer
mkdir -p novnc/utils/websockify


wget -qO- https://github.com/ConSol/noVNC/archive/consol_1.0.0.tar.gz | tar xz --strip 1 -C novnc/  || exit 1
wget -qO- https://github.com/kanaka/websockify/archive/v0.7.0.tar.gz | tar xz --strip 1 -C novnc/utils/websockify  || exit 2
chmod +x -v novnc/utils/*.sh

