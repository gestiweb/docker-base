ts := $(shell /bin/date "+%Y%m%d")
help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

#remove:
#	docker images -q gestiweb/debian-jessie:latest
build:
	docker build --pull --tag gestiweb/debian-jessie:latest --tag gestiweb/debian-jessie:$(ts) $(CURDIR)

clean-container:
	@docker stop debian-jessie 2>/dev/null || echo "debian-jessie: Not running. OK."
	@docker rm debian-jessie 2>/dev/null || echo "debian-jessie: Does not exist yet. OK."
run: clean-container
	docker run -d --name debian-jessie gestiweb/debian-jessie:latest

push: build
	docker push gestiweb/debian-jessie:latest
	docker push gestiweb/debian-jessie:$(ts)
