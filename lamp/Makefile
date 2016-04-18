

help:
	@echo ""
	@echo "bootstrap: create everything, in order"
	@echo "mrproper: drop everything, maybe not-in-order, who knows."
	@echo "all: mrproper, then bootstrap."
	@echo "inspect: get critical info of this project"


bootstrap:
	(cd apache-server && make build && make run)
	(cd mariadb10-server && make build && make run)
	(cd php5-fastcgi && make build && make run)
	make inspect

mrproper:
	docker-autoclean
	(cd php5-fastcgi && make clean)
	(cd mariadb10-server && make clean && make drop-volume)
	(cd apache-server && make clean && make drop-volume)

all: mrproper bootstrap


ifeq ($(MAKECMDGOALS),inspect)
APACHE_IPADDRESS := $(shell	docker inspect apache-server-dev | python ../utils/filter-json.py lamp-www IPAddress | cut -f2)
MARIADB_ROOT_PASSWORD := $(shell docker exec mariadb10-server-dev cat /var/lib/mysql/root.passwd)
endif

inspect:
	@echo ""
	@echo "Apache IP-Address: $(APACHE_IPADDRESS)"
	@echo "MariaDB root password: $(MARIADB_ROOT_PASSWORD)"
	@echo "MyAdmin: http://$(APACHE_IPADDRESS)/phpmyadmin/"
