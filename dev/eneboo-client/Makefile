USERNAME := gestiweb
IMAGE_NAME := eneboo-client
IMAGE_TAG := latest
IMAGENAME_LABEL_TAG := dev
IMAGE_NAME_PARENT := debian-jessie

RUN_OPTS:= --memory-swappiness=99 -m 382M --memory-reservation 96M --oom-kill-disable=true --memory-swap=-1

include ../../utils/makefiles/template.mk
