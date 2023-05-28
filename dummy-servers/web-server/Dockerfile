# pull the official docker image
FROM python:3.11.1-slim

# set work directory
WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt update; apt install -y curl

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-linux-x86_64.tar.gz
RUN tar xzvf filebeat-7.17.10-linux-x86_64.tar.gz && \
    rm filebeat-7.17.10-linux-x86_64.tar.gz && \
    mv filebeat-7.17.10-linux-x86_64 /filebeat

COPY filebeat.yml /filebeat/filebeat.yml
RUN chmod go-w /filebeat/filebeat.yml
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# set env variables: PYTHONDONTWRITEBYTECODE 1  Prevents Python from writing pyc files to disc AND PYTHONUNBUFFERED 1 Prevents Python from buffering stdout and stderr 
# ENV PYTHONDONTWRITEBYTECODE 1 
# ENV PYTHONUNBUFFERED 1

# copy project
COPY ./app .

ENTRYPOINT ["/entrypoint.sh"]