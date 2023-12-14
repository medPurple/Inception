FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY ./tools/ftp_script.sh /ftp_script.sh

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod +x ./ftp_script.sh

CMD [ "/ftp_script.sh" ]