all:
	@sudo mkdir -p /home/wmessmer/data/wordpress /home/wmessmer/data/mariadb
	@sudo chmod 777 /home/wmessmer/data/wordpress /home/wmessmer/data/mariadb
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	@sudo docker system prune -af
	@sudo rm -rf /home/wmessmer/data

re : clean all

.PHONY: all clean re stop




