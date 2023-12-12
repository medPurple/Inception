FROM debian:11

MAINTAINER <wmessmer@42.fr>

RUN apt update -y

RUN apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

CMD ["vsftpd", "/etc/vsftpd.conf"]