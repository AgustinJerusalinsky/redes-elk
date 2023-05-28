FROM ubuntu/postgres:14-22.04_beta

WORKDIR /app

RUN apt update; apt install -y curl

# download filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-linux-x86_64.tar.gz
RUN tar xzvf filebeat-7.17.10-linux-x86_64.tar.gz

COPY filebeat.yml /app/filebeat-7.17.10-linux-x86_64/filebeat.yml
RUN chmod go-w /app/filebeat-7.17.10-linux-x86_64/filebeat.yml
COPY entrypoint.sh /app/entrypoint.sh
RUN chown postgres:postgres /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
RUN mkdir logs && chown -R postgres:postgres logs

# change postgres user uid and guid to 1000
RUN usermod -u 1000 postgres
RUN groupmod -g 1000 postgres

ENTRYPOINT ["/app/entrypoint.sh"]

#set command
# CMD ["postgres", "-c", "log_statement=all", "-c","log_destination=jsonlog", "-c", "log_directory=/var/lib/postgresql/data/log", "-c", "logging_collector=true"]
# CMD ["postgres", "-c", "log_statement=all", "-c", "log_directory=/var/lib/postgresql/data/log", "-c", "logging_collector=true"]
