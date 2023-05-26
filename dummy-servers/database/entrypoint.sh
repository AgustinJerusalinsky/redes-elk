#!/bin/bash

cd /app/filebeat-7.17.10-linux-x86_64 && ./filebeat -e &

cd / && ./docker-entrypoint.sh postgres -c log_statement=all -c log_directory=/var/lib/postgresql/data/log -c logging_collector=true