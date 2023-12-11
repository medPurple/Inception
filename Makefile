all:
	@sudo mkdir -p /home/data/wordpress /home/data/mariadb
	@sudo chmod 777 /home/data/wordpress /home/data/mariadb
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	@sudo docker system prune -af
	@sudo rm -rf /home/data

re : clean all

.PHONY: all clean re




