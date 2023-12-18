all:
	@sudo mkdir -p	/home/wmessmer/data/wordpress \
					/home/wmessmer/data/website \
					/home/wmessmer/data/mariadb \
					/home/wmessmer/data/minecraft
	
	@sudo chmod 777 /home/wmessmer/data/wordpress \
					/home/wmessmer/data/website \
					/home/wmessmer/data/mariadb \
					/home/wmessmer/data/minecraft

	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	@sudo docker system prune -af
	@sudo docker volume prune -af
	@sudo docker volume rm mariadb minecraft website wordpress
	@sudo rm -rf /home/wmessmer/data

re : clean all

.PHONY: all clean re stop




