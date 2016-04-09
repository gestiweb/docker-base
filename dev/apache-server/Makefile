USERNAME := gestiweb
IMAGE_NAME := apache-server
IMAGE_TAG := latest
CONTAINER_BASENAME := $(IMAGE_NAME)

# IMAGENAME LABELS ALLOWS TO FIND OLD UNTAGGED IMAGES
IMAGENAME_LABEL_KEY   := com.gestiweb.docker.image-name
IMAGENAME_LABEL_VALUE := apache-server:dev

CONTAINER_NAME := $(CONTAINER_BASENAME)-dev
CONTAINER_STATUS := $(shell docker-status $(CONTAINER_NAME) )

PRODUCTION_NAME := $(CONTAINER_BASENAME)-production
PRODUCTION_STATUS := $(shell docker-status $(PRODUCTION_NAME) )


ts := $(shell /bin/date "+%Y%m%d")
IMAGE := $(USERNAME)/$(IMAGE_NAME)
LATEST_IMAGE := $(USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)
DATE_IMAGE := $(USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)-$(ts)

OLDIMAGES := $(shell docker-image-tags $(IMAGE) '$(IMAGE_TAG).*' -q 2>/dev/null)


help:
	@echo "make build: -> compile new image $(LATEST_IMAGE) and replace :$(IMAGE_TAG) tag"
	@echo "make run: -> execute new container $(CONTAINER_NAME) from image $(LATEST_IMAGE), removing the previous container if it exists."

build:
	docker build --pull --tag $(LATEST_IMAGE) --tag $(DATE_IMAGE) $(CURDIR)
	@NEW_IMAGE=$$(docker images -q $(LATEST_IMAGE)); \
	for oldimage in $(OLDIMAGES); do \
	    if [ "$$NEW_IMAGE" != "$$oldimage" ]; then \
		echo "Removing old image $$oldimage . . ." && docker rmi $$oldimage || /bin/true; \
	    fi; \
	done

push: build
	docker push $(DATE_IMAGE)
	docker push $(LATEST_IMAGE)



list-containers:
	docker ps -a --filter "label=$(IMAGENAME_LABEL_KEY)=$(IMAGENAME_LABEL_VALUE)"
list-images:
	# If we use "-a" here, we get also the internal layers for our image.
	docker images --filter "label=$(IMAGENAME_LABEL_KEY)=$(IMAGENAME_LABEL_VALUE)"



clean-container:
ifneq (,$(findstring exists,$(CONTAINER_STATUS)))
ifneq (,$(findstring running,$(CONTAINER_STATUS)))
		@echo "Stopping container $(CONTAINER_NAME) . . ."
		docker stop $(CONTAINER_NAME)
endif
	    @echo "Removing container $(CONTAINER_NAME) . . ."
	    docker rm $(CONTAINER_NAME)
endif

run: clean-container
	docker run -d --name $(CONTAINER_NAME) $(LATEST_IMAGE)

status:
	@echo "Devel Status: $(CONTAINER_STATUS)"
	@echo "Production Status: $(PRODUCTION_STATUS)"

production:
ifneq (,$(findstring exists,$(PRODUCTION_STATUS)))
ifneq (,$(findstring running,$(PRODUCTION_STATUS)))
	@echo "Container $(PRODUCTION_NAME) is already running. Nothing done. "
endif
	@echo "Starting stopped container $(PRODUCTION_NAME) . . . "
	docker start $(PRODUCTION_NAME)
else
	@echo "Creating a new container from $(LATEST_IMAGE)"
	docker run -d --name $(PRODUCTION_NAME) $(LATEST_IMAGE)
endif

start-production:
ifneq (,$(findstring exists,$(PRODUCTION_STATUS)))
ifneq (,$(findstring running,$(PRODUCTION_STATUS)))
	$(error Container $(PRODUCTION_NAME) is already running.)
endif
	@echo "Starting stopped container $(PRODUCTION_NAME) . . . "
	docker start $(PRODUCTION_NAME)
else
	@echo "Creating a new container from $(LATEST_IMAGE)"
	docker run -d --name $(PRODUCTION_NAME) $(LATEST_IMAGE)
endif

stop-production:
ifneq (,$(findstring exists,$(PRODUCTION_STATUS)))
ifneq (,$(findstring running,$(PRODUCTION_STATUS)))
	@echo "Stopping container $(PRODUCTION_NAME) . . . "
	docker stop $(PRODUCTION_NAME)
else
	$(error Container $(PRODUCTION_NAME) was not running.)
endif
else
	$(error Container $(PRODUCTION_NAME) does not exist.)
endif


restart-production:
ifneq (,$(findstring exists,$(PRODUCTION_STATUS)))
ifneq (,$(findstring running,$(PRODUCTION_STATUS)))
	@echo "Re-starting running container $(PRODUCTION_NAME) . . . "
	docker restart $(PRODUCTION_NAME)
else
	@echo "Container status was stopped. Starting container $(PRODUCTION_NAME) anyways . . . "
	docker start $(PRODUCTION_NAME)
endif
else
	$(error Container $(PRODUCTION_NAME) does not exist.)
endif

destroy-production:
ifneq (,$(findstring exists,$(PRODUCTION_STATUS)))
ifneq (,$(findstring running,$(PRODUCTION_STATUS)))
	$(error Container $(PRODUCTION_NAME) was running. Cowardly refusing to stop it and destroy your data.)
else
	@echo "Container status was stopped. Destroying container $(PRODUCTION_NAME) and its data . . . "
	docker rm $(PRODUCTION_NAME)
endif
else
	$(error Container $(PRODUCTION_NAME) does not exist.)
endif



