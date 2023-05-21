FROM ubuntu/postgres:14-22.04_beta

WORKDIR /app

RUN apt update; apt install -y curl
# download filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-linux-x86_64.tar.gz
RUN tar xzvf filebeat-7.17.10-linux-x86_64.tar.gz

#copy filebeat config
COPY filebeat.yml /app/filebeat-7.17.10-linux-x86_64/filebeat.yml

#set command
# CMD ["postgres", "-c", "log_statement=all", "-c","log_destination=jsonlog", "-c", "log_directory=/var/lib/postgresql/data/log", "-c", "logging_collector=true"]
CMD ["postgres", "-c", "log_statement=all", "-c", "log_directory=/var/lib/postgresql/data/log", "-c", "logging_collector=true"]
