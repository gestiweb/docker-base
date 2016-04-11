
NETWORK_NAME := lamp-www

network-create:
	docker network create --driver bridge $(NETWORK_NAME)


network-remove:
	docker network rm $(NETWORK_NAME)

network-inspect:
	docker network inspect $(NETWORK_NAME)
