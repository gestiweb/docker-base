USERNAME := gestiweb
IMAGE_NAME := eneboo-cloud
IMAGE_TAG := latest
IMAGENAME_LABEL_TAG := dev
RULE_ENFORCEMENT := no
#ENEBOO_CONNSTRING :=
# run as: make debug ENEBOO_CONNSTRING="$DBNAME:$USER:PostgreSQL:$HOST:$PORT:$PASSWD"
RUN_OPTS := -e "ENEBOO_CONNSTRING=$(ENEBOO_CONNSTRING)"

include ../../utils/makefiles/template.mk
