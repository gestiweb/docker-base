
ifndef USERNAME
    $(error USERNAME must be defined to use this template.)
endif

ifndef IMAGE_NAME
    $(error IMAGE_NAME must be defined to use this template.)
endif

ifndef IMAGE_TAG
    $(error IMAGE_TAG must be defined to use this template.)
endif


IMAGE := $(USERNAME)/$(IMAGE_NAME)
LATEST_IMAGE := $(USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)


GITROOT := $(shell git rev-parse --show-toplevel)

FOLDER_TAG := $(notdir $(patsubst %/,%,$(dir $(patsubst %/,%,$(CURDIR)))))
FOLDER_IMAGE := $(notdir $(patsubst %/,%,$(CURDIR)))

DOCKERFILE_FROM := $(shell head -n5 Dockerfile | grep "FROM" | cut -f2 -d' ')
DOCKERFILE_LABEL := $(shell head -n5 Dockerfile | grep "LABEL" | grep "$(IMAGENAME_LABEL_KEY)" | cut -f2 -d' ' | cut -f2 -d'=')

# TODO: Yes, i don't know how to do this on Makefile. Using bash instead...
DOCKERFILE_FROM_USERNAME := $(shell echo $(DOCKERFILE_FROM) | cut -f1 -d'/')
DOCKERFILE_FROM_IMAGETAG := $(shell echo $(DOCKERFILE_FROM) | cut -f2 -d'/')
DOCKERFILE_FROM_IMAGE := $(shell echo $(DOCKERFILE_FROM_IMAGETAG) | cut -f1 -d':')
DOCKERFILE_FROM_TAG := $(shell echo $(DOCKERFILE_FROM_IMAGETAG) | cut -f2 -d':')

push:
	git push origin master:$(FOLDER_IMAGE)
ifdef LATEST_IMAGE
	@echo "... marking every child project as pending_rebuild"; \
	for dockerfile in $$(git grep -l "FROM $(LATEST_IMAGE)" -- $(GITROOT)/"*Dockerfile"); do \
	    touch $$dockerfile.pending_rebuild; \
	    echo "Created file $$dockerfile.pending_rebuild"; \
	done;
endif
	@test -f $(CURDIR)/Dockerfile.pending_rebuild && unlink $(CURDIR)/Dockerfile.pending_rebuild || /bin/true;

test:
	@echo "ok"
