help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

remove:
	docker images -q gestiweb/debian-jessie:latest
build: remove
	docker build --tag gestiweb/debian-jessie:latest $(CURDIR)


clean-container:
	@docker stop debian-jessie || echo "debian-jessie: Not running. OK."
	@docker rm debian-jessie || echo "debian-jessie: Does not exist yet. OK."
run: clean-container
	docker run -d --name debian-jessie gestiweb/debian-jessie

push: build
	docker push gestiweb/debian-jessie:latest
