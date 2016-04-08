ts := $(shell /bin/date "+%Y%m%d")
help:
	@echo "make build: -> compile new image and replace :base tag"
	@echo "make run: -> execute last compiled image, removing the last one."

#remove:
#	docker images -q gestiweb/apache-server:upgrade
build:
	docker build --pull --tag gestiweb/apache-server:upgrade --tag gestiweb/apache-server:upgrade-$(ts) $(CURDIR)

clean-container:
	@docker stop apache-server 2>/dev/null || echo "apache-server: Not running. OK."
	@docker rm apache-server 2>/dev/null || echo "apache-server: Does not exist yet. OK."
run: clean-container
	docker run -d --name apache-server gestiweb/apache-server:upgrade

push: build
	docker push gestiweb/apache-server:upgrade
	docker push gestiweb/apache-server:upgrade-$(ts)
