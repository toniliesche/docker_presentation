help:
	@echo
	@echo "Command List:"
	@echo "-------------"
	@echo
	@echo "\033[1;34mclean\033[0m - Clean wordpress data"
	@echo "\033[1;34mcli CT=<container name>\033[0m - Open shell inside wordpress_php container"
	@echo "\033[1;34mdocker-build\033[0m - Build all containers"
	@echo "\033[1;34mdocker-build-mariadb\033[0m - Build MariaDB image"
	@echo "\033[1;34mdocker-build-php\033[0m - Build wordpress Docker image with required php extensions"
	@echo "\033[1;34mdocker-build-php-dev\033[0m - Build wordpress Docker image with xdebug"
	@echo "\033[1;34mdocker-build-php-7.4\033[0m - Build wordpress Docker image with 7.4"
	@echo "\033[1;34mdocker-images\033[0m - Show existing Docker images"
	@echo "\033[1;34mdocker-ps\033[0m - Show running Docker containers"
	@echo "\033[1;34mdocker-psa\033[0m - Show all Docker containers"
	@echo "\033[1;34mhw-run-simple\033[0m - Run simple hello world example"
	@echo "\033[1;34mhw-down\033[0m - Stop and clean hello world example"
	@echo "\033[1;34mmariadb-detached\033[0m - Run simple Docker MariaDB container in detached mode"
	@echo "\033[1;34mmariadb-stop\033[0m - Stop running Docker MariaDB container"
	@echo "\033[1;34mmariadb-volume\033[0m - Create volume for MariaDB"
	@echo "\033[1;34mmariadb-with-volume\033[0m - Run simple Docker MariaDB container with data persistance volume in detached mode"
	@echo "\033[1;34mnginx-run\033[0m - Run simple Docker nginx container"
	@echo "\033[1;34mnginx-run-published\033[0m - Run simple Docker nginx container with published port 80"
	@echo "\033[1;34mnginx-run-detached\033[0m - Run simple Docker nginx container in detached mode"
	@echo "\033[1;34mnginx-run-compose\033[0m - Run simple Docker nginx container in docker compose mode"
	@echo "\033[1;34mnginx-stop\033[0m - Stop running Docker nginx container"
	@echo "\033[1;34mnginx-down\033[0m - Stop and clean running Docker nginx container in docker compose mode"
	@echo "\033[1;34mtraefik-down\033[0m - Stop and clean traefik load balancer"
	@echo "\033[1;34mtraefik-run\033[0m - Run traefik load balancer"
	@echo "\033[1;34mvolumes\033[0m - Show existing volumes"
	@echo "\033[1;34mwp-create-db\033[0m - Create database and user for wordpress"
	@echo "\033[1;34mwp-down\033[0m - Stop and clean wordpress example"
	@echo "\033[1;34mwp-down-traefik\033[0m - Stop and clean wordpress example with Traefik frontend"
	@echo "\033[1;34mwp-run-simple\033[0m - Run wordpress example"
	@echo "\033[1;34mwp-run-7.4\033[0m - Run wordpress example with php 7.4"
	@echo "\033[1;34mwp-run-dev\033[0m - Run wordpress example with xdebug"
	@echo "\033[1;34mwp-run-simple\033[0m - Run simple wordpress example"
	@echo "\033[1;34mwp-run-traefik\033[0m - Run wordpress example with Traefik frontend"
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
	@docker rmi traefik:2.9 php:7.4-fpm-alpine php:8.1-fpm-alpine nginx:1.23-alpine mariadb:10.9-jammy nginx:2.4
	@echo

cli:
	@echo
	@echo "\033[1;34mdocker exec -it ${CT} /bin/sh\033[0m"
	@echo
	@docker exec -it ${CT} /bin/sh
	@echo

docker-build: docker-build-php docker-build-php-dev docker-build-php-7.4 docker-build-mariadb

docker-build-mariadb:
	@echo
	@echo "\033[1;34mdocker build images/mariadb/ -t phpughh/mariadb:10.9\033[0m"
	@echo
	@docker build images/mariadb/ -t phpughh/mariadb:10.9
	@echo
	@echo

docker-build-php:
	@echo
	@echo "\033[1;34mdocker build images/php-fpm-8.1/ -t phpughh/php-fpm:8.1\033[0m"
	@echo
	@docker build images/php-fpm-8.1/ -t phpughh/php-fpm:8.1
	@echo

docker-build-php-7.4:
	@echo
	@echo "\033[1;34mdocker build images/php-fpm/ --build-arg php_version=7.4 -t phpughh/php-fpm:7.4\033[0m"
	@echo
	@docker build images/php-fpm/ --build-arg php_version=7.4 -t phpughh/php-fpm:7.4
	@echo
	@echo "\033[1;34mdocker build images/php-fpm-dev/ --build-arg php_version=7.4 -t phpughh/php-fpm:7.4-dev\033[0m"
	@echo
	@DOCKER_BUILDKIT=1 docker build images/php-fpm-dev/ --build-arg php_version=7.4 -t phpughh/php-fpm:7.4-dev
	@echo

docker-build-php-dev:
	@echo
	@echo "\033[1;34mDOCKER_BUILDKIT=1 docker build images/php-fpm-dev-8.1/ -t phpughh/php-fpm:8.1-dev\033[0m"
	@echo
	@DOCKER_BUILDKIT=1 docker build images/php-fpm-dev-8.1/ -t phpughh/php-fpm:8.1-dev
	@echo

docker-images:
	@echo
	@echo "\033[1;34mdocker images\033[0m"
	@echo
	@docker images | grep -v nfon | grep -v toni
	@echo

docker-ps:
	@echo
	@echo "\033[1;34mdocker ps\033[0m"
	@echo
	@docker ps
	@echo

docker-psa:
	@echo
	@echo "\033[1;34mdocker ps -a\033[0m"
	@echo
	@docker ps -a | grep -v nfon | grep -v toni
	@echo

hw-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld down
	@echo
	@echo

hw-run:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld up -d --remove-orphans --always-recreate-deps\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-hello-world.yml -p helloworld up -d --remove-orphans --always-recreate-deps
	@echo

mariadb-detached:
	@echo
	@echo "\033[1;34mdocker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh mariadb:10.9-jammy\033[0m"
	@echo
	@docker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh mariadb:10.9-jammy
	@echo

mariadb-stop:
	@echo
	@echo "\033[1;34mdocker stop mariadb\033[0m"
	@echo
	@docker stop mariadb
	@echo
	@echo

mariadb-volume:
	@echo
	@echo "\033[1;34mdocker volume create wordpress_mariadb_data\033[0m"
	@echo
	@docker volume create wordpress_mariadb_data
	@echo

mariadb-with-volume:
	@echo
	@echo "\033[1;34mdocker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh -v wordpress_mariadb_data:/var/lib/mysql mariadb:10.9-jammy\033[0m"
	@echo
	@docker run --name mariadb --rm -p 3306:3306 -d --env MARIADB_ROOT_PASSWORD=phpughh -v wordpress_mariadb_data:/var/lib/mysql mariadb:10.9-jammy
	@echo

nginx-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-nginx.yml -p nginx down\033[0m"
	@echo
	@docker compose -f docker-compose/docker-compose-nginx.yml -p nginx down
	@echo
	@echo

nginx-run:
	@echo
	@echo "\033[1;34mdocker run --name nginx --rm nginx:1.23-alpine\033[0m"
	@echo
	@docker run --name nginx --rm nginx:1.23-alpine
	@echo

nginx-run-compose:
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

traefik-down:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-traefik.yml -p traefik down\033[0m"
	@docker compose -f docker-compose/docker-compose-traefik.yml -p traefik down

traefik-run:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-traefik.yml -p traefik up -d --remove-orphans --always-recreate-deps\033[0m"
	@docker compose -f docker-compose/docker-compose-traefik.yml -p traefik up -d --remove-orphans --always-recreate-deps

volumes:
	@echo
	@echo "\033[1;34mdocker volume ls\033[0m"
	@echo
	@docker volume ls
	@echo

wp-create-db:
	@echo
	@echo mysql -uroot -pphpughh -e "CREATE DATABASE wordpress_phpughh"
	@mysql -uroot -pphpughh -e "CREATE DATABASE wordpress_phpughh"
	@echo mysql -uroot -pphpughh -e "GRANT ALL PRIVILEGES ON wordpress_phpughh.* TO wordpress@'%' IDENTIFIED BY 'phpughh'"
	@mysql -uroot -pphpughh -e "GRANT ALL PRIVILEGES ON wordpress_phpughh.* TO wordpress@'%' IDENTIFIED BY 'phpughh'"
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

wp-run-dev:
	@echo
	@echo "echo XDEBUG_HOST=\$$(ifconfig docker0 | grep \"inet \" | awk '{print \$$2}') > .env"
	@echo XDEBUG_HOST=$$(ifconfig docker0 | grep "inet " | awk '{print $$2}') > .env
	@echo "echo XDEBUG_PORT=9000 >> .env"
	@echo XDEBUG_PORT=9000 >> .env
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

wp-down-traefik:
	@echo
	@echo "\033[1;34mdocker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress down\033[0m"
	@docker compose -f docker-compose/docker-compose-wp-traefik.yml --env-file .env -p wordpress down
	@echo

wp-run: docker-build mariadb-volume traefik-run wp-run-traefik wp-create-db