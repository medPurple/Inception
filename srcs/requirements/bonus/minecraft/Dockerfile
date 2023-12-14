FROM debian:bullseye

MAINTAINER <wmessmer@42.fr> 

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install -y openjdk-17-jre-headless

WORKDIR /minecraft

COPY conf/server.jar /usr/bin/server.jar
COPY conf/eula.txt .

ENTRYPOINT ["java", "-Xms1024m", "-Xmx2560m", "-jar", "/usr/bin/server.jar", "nogui;"] 