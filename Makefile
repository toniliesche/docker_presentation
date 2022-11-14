UNAME := $(shell uname -a)
ifneq (,$(findstring microsoft,$(UNAME)))
	LINUX_MODE := "wsl"
else
    LINUX_MODE := "native"
endif

help:
	@echo
	@echo "Command List:"
	@echo "-------------"
	@echo
	@echo "\033[1;34mclean\033[0m - Clean wordpress data"
	@echo "\033[1;34mclean-images\033[0m - Remove created images"
	@echo "\033[1;34mcli CT=<container name>\033[0m - Open shell inside wordpress_php container"
	@echo "\033[1;34mdocker-build\033[0m - Build all containers"
	@echo "\033[1;34mdocker-build-mariadb\033[0m - Build MariaDB image"
	@echo "\033[1;34mdocker-build-php\033[0m - Build wordpress Docker image with required php extensions"
	@echo "\033[1;34mdocker-build-php-7.4\033[0m - Build wordpress Docker image with 7.4"
	@echo "\033[1;34mdocker-build-php-dev\033[0m - Build wordpress Docker image with xdebug"
	@echo "\033[1;34mdocker-build-traefik\033[0m - Build Traefik Docker image with middleware addition"
	@echo "\033[1;34mdocker-build-wordpress\033[0m - Build Wordpress Docker images"
	@echo "\033[1;34mdocker-images\033[0m - Show existing Docker images"
	@echo "\033[1;34mdocker-logs CT=<container name>\033[0m - Attach to container's stdout"
	@echo "\033[1;34mdocker-network-create\033[0m - Create new Docker network"
	@echo "\033[1;34mdocker-network-inspect\033[0m - Show details of existing Docker network"
	@echo "\033[1;34mdocker-network-ls\033[0m - List existing Docker networks"
	@echo "\033[1;34mdocker-ps\033[0m - Show running Docker containers"
	@echo "\033[1;34mdocker-psa\033[0m - Show all Docker containers"
	@echo "\033[1;34mdocker-swarm-deploy-mariadb\033[0m - Deploy MariaDB composition to Docker swarm"
	@echo "\033[1;34mdocker-swarm-deploy-traefik\033[0m - Deploy Traefik composition to Docker swarm"
	@echo "\033[1;34mdocker-swarm-deploy-wordpress\033[0m - Deploy Wordpress composition to Docker swarm"
	@echo "\033[1;34mdocker-swarm-init\033[0m - Initialize Docker swarm"
	@echo "\033[1;34mdocker-swarm-list\033[0m - Show Docker swarm stacks"
	@echo "\033[1;34mdocker-swarm-network-create\033[0m - Create new Docker swarm network"
	@echo "\033[1;34mdocker-swarm-ps ST=<stack name>\033[0m - Show details of Docker swarm stack"
	@echo "\033[1;34mhw-down\033[0m - Stop and clean hello world example"
	@echo "\033[1;34mhw-run\033[0m - Run simple hello world example"
	@echo "\033[1;34mhw-run-traefik\033[0m - Run simple hello world example behind Traefik"
	@echo "\033[1;34mhw-run-traefik-extended\033[0m - Run simple hello world example behind Traefik with logging extensions"
	@echo "\033[1;34mk8s-traefik-clusterrole\033[0m - Create K8s cluster role for Traefik"
	@echo "\033[1;34mk8s-traefik-deployment\033[0m - Create K8s deployment for Traefik"
	@echo "\033[1;34mk8s-traefik-ingress\033[0m - Create K8s ingress route for Traefik"
	@echo "\033[1;34mk8s-traefik-namespace\033[0m - Create K8s namespace for Traefik"
	@echo "\033[1;34mk8s-traefik-rolebinding\033[0m - Create K8s role binding for Traefik service account"
	@echo "\033[1;34mk8s-traefik-service\033[0m - Create K8s service definition"
	@echo "\033[1;34mk8s-traefik-serviceaccount\033[0m - Create K8s service account"
	@echo "\033[1;34mmariadb\033[0m - Connect to mariadb database using cli tool"
	@echo "\033[1;34mmariadb-run\033[0m - Run simple Docker MariaDB container"
	@echo "\033[1;34mmariadb-run-persistent\033[0m - Run simple Docker MariaDB container with data persistance volume in detached mode"
	@echo "\033[1;34mmariadb-stop\033[0m - Stop running Docker MariaDB container"
	@echo "\033[1;34mmariadb-volume-create\033[0m - Create volume for MariaDB"
	@echo "\033[1;34mmariadb-volume-show\033[0m - Show volume content for MariaDB inside file system"
	@echo "\033[1;34mnginx-down\033[0m - Stop and clean running Docker Nginx container in docker compose mode"
	@echo "\033[1;34mnginx-inspect\033[0m - Inspect running Docker Nginx container"
	@echo "\033[1;34mnginx-inspect-network\033[0m - Inspect running Docker Nginx container with format directive"
	@echo "\033[1;34mnginx-logs\033[0m - Show logs of Docker Nginx container"
	@echo "\033[1;34mnginx-run\033[0m - Run simple Docker Nginx container"
	@echo "\033[1;34mnginx-run-compose\033[0m - Run simple Docker Nginx container in docker compose mode"
	@echo "\033[1;34mnginx-run-compose-detached\033[0m - Run simple Docker Nginx container in detached docker compose mode"
	@echo "\033[1;34mnginx-run-detached\033[0m - Run simple Docker Nginx container in detached mode"
	@echo "\033[1;34mnginx-run-dynamic\033[0m - Run simple Docker Nginx container with dynamic subdomain rewrite"
	@echo "\033[1;34mnginx-run-published\033[0m - Run simple Docker Nginx container with published port 80"
	@echo "\033[1;34mnginx-stop\033[0m - Stop running Docker Nginx container"
	@echo "\033[1;34msetup-xdebug\033[0m - Set Xdebug .env variables for remote debugging"
	@echo "\033[1;34mtraefik-run\033[0m - Run traefik load balancer"
	@echo "\033[1;34mtraefik-run-extended\033[0m - Run traefik load balancer with logging extensions"
	@echo "\033[1;34mvolumes\033[0m - Show existing volumes"
	@echo "\033[1;34mwp-create-db\033[0m - Create database and user for wordpress"
	@echo "\033[1;34mwp-down\033[0m - Stop and clean wordpress example"
	@echo "\033[1;34mwp-down-traefik\033[0m - Stop and clean wordpress example with Traefik frontend"
	@echo "\033[1;34mwp-run-simple\033[0m - Run wordpress example"
	@echo "\033[1;34mwp-run-7.4\033[0m - Run wordpress example with php 7.4"
	@echo "\033[1;34mwp-run-dev\033[0m - Run wordpress example with xdebug"
	@echo "\033[1;34mwp-run-simple\033[0m - Run simple wordpress example"
	@echo "\033[1;34mwp-run-traefik\033[0m - Run wordpress example with Traefik frontend"
	@echo "\033[1;34mwp-run-traefik-extended\033[0m - Run wordpress example with Traefik frontend with logging extension"
	@echo "\033[1;34mwp-run-windows\033[0m - Run wordpress example with Windows mounted codebase"
	@echo

clean:
	@echo
	@echo "\033[1;34mdocker volume rm wordpress_mariadb_data\033[0m"
	@echo
	@docker volume rm wordpress_mariadb_data
	@echo

clean-images:
	@echo
	@echo "\033[1;34mdocker volume rm wordpress_mariadb_data\033[0m"
	@echo
	@docker rmi traefik:2.9 php:7.4-fpm-alpine php:8.1-fpm-alpine nginx:1.23-alpine mariadb:10.6-focal nginx:2.4
	@echo

cli:
	@echo
	@echo "\033[1;34mdocker exec -it ${CT} /bin/sh\033[0m"
	@echo
	@docker exec -it ${CT} /bin/sh
	@echo

docker-logs:
	@echo
	@echo "\033[1;34mdocker logs -f ${CT}\033[0m"
	@echo
	@docker logs -f ${CT}
	@echo

docker-build: docker-build-php docker-build-php-dev docker-build-php-7.4 docker-build-mariadb

docker-build-mariadb:
	@echo
	@echo "\033[1;34mdocker build images/mariadb/ -t phpughh/mariadb:10.6\033[0m"
	@echo
	@docker build images/mariadb/ -t phpughh/mariadb:10.6
	@echo

docker-build-php:
	@echo
	@echo "\033[1;34mdocker build images/php-fpm-8.1/ -t phpughh/php-fpm:8.1\033[0m"
	@echo
	@docker build images/php-fpm-8.1/ -t phpughh/php-fpm:8.1
	@echo

docker-build-php-7.4:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-build-php7.4.yml build php\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-build-php7.4.yml build php
	@echo
	@echo "\033[1;34mDOCKER_BUILDKIT=1 docker compose -f docker-compose/docker-compose-build-php7.4.yml build php-dev\033[0m"
	@echo
	@DOCKER_BUILDKIT=1 docker compose -f docker-compose/docker-compose-build-php7.4.yml build php-dev
	@echo

docker-build-php-dev:
	@echo
	@echo "\033[1;34mDOCKER_BUILDKIT=1 docker build images/php-fpm-dev-8.1/ -t phpughh/php-fpm:8.1-dev\033[0m"
	@echo
	@DOCKER_BUILDKIT=1 docker build images/php-fpm-dev-8.1/ -t phpughh/php-fpm:8.1-dev
	@echo

docker-build-traefik:
	@echo
	@echo "\033[1;34mdocker build images/traefik/ -t phpughh/traefik:2.9\033[0m"
	@echo
	@docker build images/traefik/ -t phpughh/traefik:2.9
	@echo

docker-build-wordpress:
	@echo
	@echo "\033[1;34mdocker build images/wordpress-php/ -t phpughh/wordpress-php:6.0.3\033[0m"
	@echo
	@docker build images/wordpress-php/ -t phpughh/wordpress-php:6.0.3
	@echo
	@echo "\033[1;34mdocker build --build-arg wordpress_version=6.0.3 images/wordpress-nginx/ -t phpughh/wordpress-nginx:6.0.3\033[0m"
	@echo
	@docker build --build-arg wordpress_version=6.0.3 images/wordpress-nginx/ -t phpughh/wordpress-nginx:6.0.3
	@echo

docker-images:
	@echo
	@echo "\033[1;34mdocker images\033[0m"
	@echo
	@docker images | grep -v nfon | grep -v toni
	@echo

docker-network-create:
	@echo
	@echo "\033[1;34mdocker network create phpughh\033[0m"
	@echo
	@docker network create phpughh
	@docker network create phpughh_traefik
	@echo

docker-network-ls:
	@echo
	@echo "\033[1;34mdocker network ls\033[0m"
	@echo
	@docker network ls | grep -v nfon | grep -v toni
	@echo

docker-network-inspect:
	@echo
	@echo "\033[1;34mdocker network inspect phpughh\033[0m"
	@echo
	@docker network inspect phpughh
	@echo

docker-ps:
	@echo
	@echo "\033[1;34mdocker ps\033[0m"
	@echo
	@docker ps | grep -v nfon | grep -v toni | grep -v k8s
	@echo

docker-psa:
	@echo
	@echo "\033[1;34mdocker ps -a\033[0m"
	@echo
	@docker ps -a | grep -v nfon | grep -v toni | grep -v k8s
	@echo

docker-swarm-init:
	@echo
	@echo "\033[1;34mdocker swarm init\033[0m"
	@echo
	@docker swarm init
	@echo

docker-swarm-network-create:
	@echo
	@echo "\033[1;34mdocker network create --opt encrypted --driver overlay --attachable swarm_traefik --subnet 10.7.0.0/22\033[0m"
	@echo
	@docker network create --opt encrypted --driver overlay --attachable swarm_traefik --subnet 10.7.0.0/22
	@echo

docker-swarm-deploy-mariadb:
	@echo
	@echo "\033[1;34mdocker stack deploy -c docker-swarm/docker-compose-mariadb.yml --orchestrator swarm mariadb\033[0m"
	@echo
	@docker stack deploy -c docker-swarm/docker-compose-mariadb.yml --orchestrator swarm mariadb
	@echo

docker-swarm-deploy-traefik:
	@echo
	@echo "\033[1;34mdocker stack deploy -c docker-swarm/docker-compose-traefik.yml --orchestrator swarm traefik\033[0m"
	@echo
	@docker stack deploy -c docker-swarm/docker-compose-traefik.yml --orchestrator swarm traefik
	@echo

docker-swarm-deploy-wordpress:
	@echo
	@echo "\033[1;34mdocker stack deploy -c docker-swarm/docker-compose-wordpress.yml --orchestrator swarm wordpress\033[0m"
	@echo
	@docker stack deploy -c docker-swarm/docker-compose-wordpress.yml --orchestrator swarm wordpress
	@echo

docker-swarm-list:
	@echo
	@echo "\033[1;34mdocker stack ls\033[0m"
	@echo
	@docker stack ls
	@echo

docker-swarm-ps:
	@echo
	@echo "\033[1;34mdocker stack ps ${ST}\033[0m"
	@echo
	@docker stack ps ${ST}
	@echo

hw-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld down
	@echo

hw-run:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld up -d --remove-orphans --always-recreate-deps
	@echo

hw-run-traefik:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world-traefik.yml -p helloworld up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world-traefik.yml -p helloworld up -d --remove-orphans --always-recreate-deps
	@echo

hw-run-traefik-extended:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world-traefik-extended.yml -p helloworld up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world-traefik-extended.yml -p helloworld up -d --remove-orphans --always-recreate-deps
	@echo

k8s-traefik-clusterrole:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-clusterrole-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-clusterrole-traefik.yaml
	@echo

k8s-traefik-deployment:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-deployment-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-deployment-traefik.yaml
	@echo

k8s-traefik-ingress:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-ingress-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-ingress-traefik.yaml
	@echo

k8s-traefik-namespace:
	@echo
	@echo "\033[1;34mkubectl create namespace traefik\033[0m"
	@echo
	@kubectl create namespace traefik
	@echo

k8s-traefik-rolebinding:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-rolebinding-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-rolebinding-traefik.yaml
	@echo

k8s-traefik-service:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-service-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-service-traefik.yaml
	@echo

k8s-traefik-serviceaccount:
	@echo
	@echo "\033[1;34mkubectl apply -f kubernetes/k8s-serviceaccount-traefik.yaml\033[0m"
	@echo
	@kubectl apply -f kubernetes/k8s-serviceaccount-traefik.yaml
	@echo

mariadb:
	@echo
	@echo "\033[1;34mmysql -h 127.0.0.1 -uroot -pphpughh\033[0m"
	@echo
	@mysql -h 127.0.0.1 -uroot -pphpughh
	@echo

mariadb-run:
	@echo
	@echo "\033[1;34mdocker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh mariadb:10.6-focal\033[0m"
	@echo
	@docker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh mariadb:10.6-focal
	@echo

mariadb-run-persistent:
	@echo
	@echo "\033[1;34mdocker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh -v wordpress_mariadb_data:/var/lib/mysql mariadb:10.6-focal\033[0m"
	@echo
	@docker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh -v wordpress_mariadb_data:/var/lib/mysql mariadb:10.6-focal
	@echo

mariadb-stop:
	@echo
	@echo "\033[1;34mdocker stop mariadb\033[0m"
	@echo
	@docker stop mariadb
	@echo
	@echo

mariadb-volume-create:
	@echo
	@echo "\033[1;34mdocker volume create wordpress_mariadb_data\033[0m"
	@echo
	@docker volume create wordpress_mariadb_data
	@echo

mariadb-volume-show:
	@echo
	@echo "\033[1;34msudo ls -lA /var/lib/docker/volumes/wordpress_mariadb_data/_data\033[0m"
	@echo
	@sudo ls -lA /var/lib/docker/volumes/wordpress_mariadb_data/_data
	@echo

nginx-logs:
	@echo
	@echo "\033[1;34mdocker logs -f nginx\033[0m"
	@echo
	@docker logs -f nginx
	@echo

nginx-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx.yml -p nginx down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx.yml -p nginx down
	@echo

nginx-down-dynamic:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx-dynamic.yml -p nginx down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx-dynamic.yml -p nginx down
	@echo

nginx-inspect:
	@echo
	@echo "\033[1;34mdocker inspect nginx\033[0m"
	@echo
	@docker inspect nginx
	@echo

nginx-inspect-network:
	@echo
	@echo "\033[1;34mdocker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx\033[0m"
	@echo
	@docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx
	@echo

nginx-run:
	@echo
	@echo "\033[1;34mdocker run --name nginx --rm nginx:1.23-alpine\033[0m"
	@echo
	@docker run --name nginx --rm nginx:1.23-alpine
	@echo

nginx-run-compose:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx.yml -p nginx up --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx.yml -p nginx up --remove-orphans --always-recreate-deps
	@echo

nginx-run-dynamic:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx-dynamic.yml -p nginx up --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx-dynamic.yml -p nginx up -d --remove-orphans --always-recreate-deps

nginx-run-compose-detached:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx.yml -p nginx up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx.yml -p nginx up -d --remove-orphans --always-recreate-deps
	@echo

nginx-run-published:
	@echo
	@echo "\033[1;34mdocker run --name nginx --rm -p 80:80 nginx:1.23-alpine\033[0m"
	@echo
	@docker run --name nginx --rm -p 80:80 nginx:1.23-alpine
	@echo

nginx-run-detached:
	@echo
	@echo "\033[1;34mdocker run --name nginx --rm -p 80:80 -d nginx:1.23-alpine\033[0m"
	@echo
	@docker run --name nginx --rm -p 80:80 -d nginx:1.23-alpine
	@echo

nginx-stop:
	@echo
	@echo "\033[1;34mdocker stop nginx\033[0m"
	@echo
	@docker stop nginx
	@echo

setup-xdebug-native:
	@echo
	@echo "echo XDEBUG_HOST=\$$(ifconfig docker0 | grep \"inet \" | awk '{print \$$2}') > .env"
	@echo XDEBUG_HOST=$$(ifconfig docker0 | grep "inet " | awk '{print $$2}') > .env
	@echo "echo XDEBUG_PORT=9000 >> .env"
	@echo XDEBUG_PORT=9000 >> .env

setup-xdebug-vm:
	@echo
	@echo "echo XDEBUG_HOST=\$$(cat /etc/resolv.conf | grep nameserver | awk '{print \$$2}') > .env"
	@echo XDEBUG_HOST=$$(cat /etc/resolv.conf | grep nameserver | awk '{print $$2}') > .env
	@echo "echo XDEBUG_PORT=9000 >> .env"
	@echo XDEBUG_PORT=9000 >> .env

setup-xdebug-wsl:
	@echo
	@echo "echo XDEBUG_HOST=\$$(ifconfig eth0 | grep \"inet \" | awk '{print \$$2}') > .env"
	@echo XDEBUG_HOST=$$(ifconfig eth0 | grep "inet " | awk '{print $$2}') > .env
	@echo "echo XDEBUG_PORT=9000 >> .env"
	@echo XDEBUG_PORT=9000 >> .env

traefik-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-traefik.yml -p traefik down\033[0m"
	@docker compose -f docker-compose/docker-compose-traefik.yml -p traefik down

traefik-run:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-traefik.yml -p traefik up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-traefik.yml -p traefik up -d --remove-orphans --always-recreate-deps

traefik-run-extended:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-traefik-extended.yml -p traefik up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-traefik-extended.yml -p traefik up -d --remove-orphans --always-recreate-deps

volumes:
	@echo
	@echo "\033[1;34mdocker volume ls\033[0m"
	@echo
	@docker volume ls
	@echo

wp-create-db:
	@echo
	@echo mysql -h 127.0.0.1 -uroot -pphpughh -e "CREATE DATABASE wordpress_phpughh"
	@mysql -h 127.0.0.1 -uroot -pphpughh -e "CREATE DATABASE wordpress_phpughh"
	@echo mysql -h 127.0.0.1 -uroot -pphpughh -e "GRANT ALL PRIVILEGES ON wordpress_phpughh.* TO wordpress@'%' IDENTIFIED BY 'phpughh'"
	@mysql -h 127.0.0.1 -uroot -pphpughh -e "GRANT ALL PRIVILEGES ON wordpress_phpughh.* TO wordpress@'%' IDENTIFIED BY 'phpughh'"
	@echo

wp-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp.yml -p wordpress down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-wp.yml -p wordpress down
	@echo
	@echo

wp-run-simple:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp.yml -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-wp.yml -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-run-windows:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-win.yml -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-wp-win.yml -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-docker-sync:
	@echo
	@echo "\033[1;34mdocker-sync start -c ~/phpughh/wordpress_win/docker-sync.yml\033[0m"
	@echo
	@docker-sync start -c ~/phpughh/wordpress_win/docker-sync.yml
	@echo

wp-docker-sync-stop:
	@echo
	@echo "\033[1;34mdocker-sync stop -c ~/phpughh/wordpress_win/docker-sync.yml\033[0m"
	@echo
	@docker-sync stop -c ~/phpughh/wordpress_win/docker-sync.yml
	@echo

wp-run-docker-sync:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-docker-sync.yml -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-wp-docker-sync.yml -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-run-dev: setup-xdebug
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-dev.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-dev.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-run-7.4:
	@echo
	@echo "echo PHP_VERSION=7.4 >> .env"
	@echo PHP_VERSION=7.4 >> .env
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-versioned.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-versioned.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-run-traefik:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-run-traefik-extended:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-traefik-extended.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-traefik-extended.yml --env-file .env -p wordpress up -d --remove-orphans --always-recreate-deps
	@echo

wp-down-traefik:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress down\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress down
	@echo

# Alias commands from here

wp-run: docker-build mariadb-volume-create traefik-run wp-run-traefik wp-create-db

ifeq ($(LINUX_MODE), "wsl")
setup-xdebug: setup-xdebug-wsl
else ifeq ($(LINUX_MODE), "vm")
setup-xdebug: setup-xdebug-vm
else
setup-xdebug: setup-xdebug-native
endif

ngxr: nginx-run
ngxrp: nginx-run-published
ngxrd: nginx-run-detached
ngxs: nginx-stop
ngxi: nginx-inspect
ngxin: nginx-inspect-network
ngxl: nginx-logs

ngxcr: nginx-run-compose
ngxcrd: nginx-run-compose-detached
ngxcd: nginx-down
ngxcrr: nginx-run-dynamic
ngxdd: nginx-down-dynamic

hwr: hw-run
hwd: hw-down

mdbr: mariadb-run
mdbv: mariadb-volume-create
mdbrp: mariadb-run-persistent
mdbs: mariadb-stop
mdb: mariadb

di: docker-images
dbmdb: docker-build-mariadb
dps: docker-ps
dpsa: docker-psa
dnc: docker-network-create
dnl: docker-network-ls
dni: docker-network-inspect
dl: docker-logs
dbwp: docker-build-wordpress

dbp: docker-build-php
dbpd: docker-build-php-dev
dbp7: docker-build-php-7.4
dbtr: docker-build-traefik

dsi: docker-swarm-init
dsnc: docker-swarm-network-create
dsdtr: docker-swarm-deploy-traefik
dsdmdb: docker-swarm-deploy-mariadb
dsdwp: docker-swarm-deploy-wordpress
dsls: docker-swarm-list
dsps: docker-swarm-ps

wpr: wp-run-simple
wprd: wp-run-dev
wpr7: wp-run-7.4
wprt: wp-run-traefik hw-run-traefik
wprw: wp-run-windows
wprds: wp-run-docker-sync
wpdbs: wp-create-db
wpd: wp-down
wpdt: wp-down-traefik
wpds: wp-docker-sync
wpdss: wp-down wp-docker-sync-stop

trr: traefik-run
trre: traefik-run-extended
trrec: traefik-run-extended wp-run-traefik-extended hw-run-traefik-extended
trd: traefik-down
trde: traefik-down wp-down hw-down

k8trcr: k8s-traefik-clusterrole
k8trdp: k8s-traefik-deployment
k8trig: k8s-traefik-ingress
k8trns: k8s-traefik-namespace
k8trrb: k8s-traefik-rolebinding
k8trsa: k8s-traefik-serviceaccount
k8trsv: k8s-traefik-service
