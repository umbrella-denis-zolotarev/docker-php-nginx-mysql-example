-include ./.env
export $(test -e || shell sed 's/=.*//' ./.env)

ifeq (${DOCKER_ENV},dev)
    DOCKER_COMPOSE_CMD = docker-compose -f ./docker-compose.yml -f ./docker-compose-dev.yml --env-file=./.env
else
	DOCKER_COMPOSE_CMD = docker-compose
endif

init-env-dev:
	cp .env.dev .env
init-env-prod:
	cp .env.prod .env
echo-env:
	echo "${COMPOSE_PROJECT_NAME}"
ls:
	docker image ls
	docker network ls
	docker volume ls
	docker container ps -a

build:
	$(DOCKER_COMPOSE_CMD) build --no-cache
up:
	$(DOCKER_COMPOSE_CMD) up -d
down:
	$(DOCKER_COMPOSE_CMD) down
stop:
	$(DOCKER_COMPOSE_CMD) stop
restart: stop up

status:
	docker ps -a

logs-nginx:
	$(DOCKER_COMPOSE_CMD) logs --tail=100 -f nginx-container
logs-php:
	$(DOCKER_COMPOSE_CMD) logs --tail=100 -f php-container
logs-php-clone:
	$(DOCKER_COMPOSE_CMD) logs --tail=100 -f php-clone-container
logs-mysql:
	$(DOCKER_COMPOSE_CMD) logs --tail=100 -f mysql-container

console-nginx:
	$(DOCKER_COMPOSE_CMD) exec nginx-container bash
console-php:
	$(DOCKER_COMPOSE_CMD) exec php-container bash
console-php-clone:
	$(DOCKER_COMPOSE_CMD) exec php-clone-container bash
console-mysql:
	$(DOCKER_COMPOSE_CMD) exec mysql-container bash

stop-clear-docker: stop clear-docker
clear-docker:
	docker system prune -af
	docker volume prune -f
	docker network prune -f
