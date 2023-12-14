FROM debian:bullseye

RUN apt update && apt-get upgrade -y && apt install -y vsftpd

COPY ./tools/ftp_script.sh /ftp_script.sh

RUN chmod +x ./ftp_script.sh

CMD [ "/ftp_script.sh" ]