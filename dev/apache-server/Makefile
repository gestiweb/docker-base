help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

remove:
	docker images -q gestiweb/apache-server:latest
build: remove
	docker build --tag gestiweb/apache-server:latest $(CURDIR)


clean-container:
	docker stop apache-server
	docker rm apache-server
run: clean-container
	docker run -d --name apache-server gestiweb/apache-server
