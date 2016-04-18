

help:
	@echo "bootstrap: create everything, in order"
	@echo "mrproper: drop everything, maybe not-in-order, who knows."


bootstrap:
	(cd apache-server && make build && make run)
	(cd mariadb10-server && make build && make run)
	(cd php5-fastcgi && make build && make run)

mrproper:
	docker-autoclean
	(cd php5-fastcgi && make clean)
	(cd mariadb10-server && make clean && make drop-volume)
	(cd apache-server && make clean && make drop-volume)

all: mrproper bootstrap
