ts := $(shell /bin/date "+%Y%m%d")
help:
	@echo "make build: -> compile new image and replace :base tag"
	@echo "make run: -> execute last compiled image, removing the last one."

#remove:
#	docker images -q gestiweb/debian-jessie:upgrade
build:
	docker build --pull --tag gestiweb/debian-jessie:upgrade --tag gestiweb/debian-jessie:upgrade-$(ts) $(CURDIR)

clean-container:
	@docker stop debian-jessie 2>/dev/null || echo "debian-jessie: Not running. OK."
	@docker rm debian-jessie 2>/dev/null || echo "debian-jessie: Does not exist yet. OK."
run: clean-container
	docker run -d --name debian-jessie gestiweb/debian-jessie:upgrade

push: build
	docker push gestiweb/debian-jessie:upgrade
	docker push gestiweb/debian-jessie:upgrade-$(ts)
