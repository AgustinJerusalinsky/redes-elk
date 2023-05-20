FROM bitnami/postgresql:12.15.0-debian-11-r2

WORKDIR /app
USER root
RUN apt update; apt install -y curl
# download filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-amd64.deb
RUN dpkg -i filebeat-7.17.10-amd64.deb

#copy filebeat config

#remove postunpack script
RUN echo ''> /opt/bitnami/scripts/postunpack.sh

USER 1001
#set command
#CMD ["postgres", "-c", "log_statement=all", "-c","log_destination=jsonlog", "-c", "log_directory=/var/lib/postgresql/data/log", "-c", "logging_collector=true"]