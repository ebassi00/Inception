all: first start

first:
	@sudo mkdir -p /home/edoardo/data/wordpress
	@sudo mkdir -p /home/edoardo/data/mariadb
	@echo "127.0.0.1 ebassi.42.fr" > /etc/hosts
	@echo "127.0.0.1 www.ebassi.42.fr" >> /etc/hosts
	@echo "127.0.0.1 localhost" >> /etc/hosts

start:
	@docker-compose -f ./srcs/docker-compose.yml build
	@docker-compose -f ./srcs/docker-compose.yml up

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker volume rm -f wordpress
	@docker volume rm -f mariadb
	@docker system prune -af
	@sudo rm -fr /home/edoardo/data

re: fclean first start

.PHONY: all first start stop fclean re