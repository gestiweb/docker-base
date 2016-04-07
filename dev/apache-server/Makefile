help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

remove:
	docker images -q gestiweb/apache-server:latest
build: remove
	docker build --pull --tag gestiweb/apache-server:latest $(CURDIR)


clean-container:
	@docker stop apache-server || echo "Apache-Server: Not running. OK."
	@docker rm apache-server || echo "Apache-Server: Does not exist yet. OK."
run: clean-container
	docker run -d --name apache-server gestiweb/apache-server

push: build
	docker push gestiweb/apache-server:latest
