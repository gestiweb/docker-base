#!/bin/bash

# BUILD:

docker build --label gestiweb/eneboo-cloud --tag gestiweb/eneboo-cloud .


# RUN:
docker run -itd --name "gestiweb_eneboocloud" gestiweb/eneboo-cloud
