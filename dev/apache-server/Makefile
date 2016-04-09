USERNAME := gestiweb
IMAGE_NAME := apache-server
IMAGE_TAG := latest
CONTAINER_NAME := apache-server
CONTAINER_STATUS := $(shell docker-status $(CONTAINER_NAME) )
ts := $(shell /bin/date "+%Y%m%d")
IMAGE := $(USERNAME)/$(IMAGE_NAME)
LATEST_IMAGE := $(USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)
DATE_IMAGE := $(USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)-$(ts)
# IMAGENAME LABELS ALLOWS TO FIND OLD UNTAGGED IMAGES
IMAGENAME_LABEL_KEY   := com.gestiweb.docker.image-name
IMAGENAME_LABEL_VALUE := apache-server:upgrade

OLDIMAGES := $(shell docker-image-tags $(IMAGE) '$(IMAGE_TAG).*' -q 2>/dev/null)


help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

build:
	docker build --pull --tag $(LATEST_IMAGE) --tag $(DATE_IMAGE) $(CURDIR)
	# OLDIMAGES here is blank if there aren't any.
	# ... if we rebuilt without any changes OLDIMAGES also has the newly built image
	@echo "Old images:" $(OLDIMAGES)

list-containers:
	docker ps -a --filter "label=$(IMAGENAME_LABEL_KEY)=$(IMAGENAME_LABEL_VALUE)"
list-images:
	# If we use "-a" here, we get also the internal layers for our image.
	docker images --filter "label=$(IMAGENAME_LABEL_KEY)=$(IMAGENAME_LABEL_VALUE)"

clean-container:
ifneq (,$(findstring exists,$(CONTAINER_STATUS)))
ifneq (,$(findstring running,$(CONTAINER_STATUS)))
		@echo "Stopping container . . ."
		docker stop apache-server
endif
	    @echo "Removing container . . ."
	    docker rm apache-server
endif
run: clean-container
	docker run -d --name apache-server gestiweb/apache-server:latest

push: build
	docker push gestiweb/apache-server:latest
