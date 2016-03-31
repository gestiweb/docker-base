help:
	@echo "make build: -> compile new image and replace :latest tag"
	@echo "make run: -> execute last compiled image, removing the last one."

remove:
	docker images -q gestiweb/mariadb-server:latest
build: remove
	docker build --tag gestiweb/mariadb-server:latest $(CURDIR)


clean-container:
	@docker stop mariadb-server || echo "mariadb-server: Not running. OK."
	@docker rm mariadb-server || echo "mariadb-server: Does not exist yet. OK."
run: clean-container
	docker run -d --name mariadb-server gestiweb/mariadb-server

push: build
	docker push gestiweb/mariadb-server
