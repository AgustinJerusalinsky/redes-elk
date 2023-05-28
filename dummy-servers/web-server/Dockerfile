# pull the official docker image
FROM python:3.11.1-slim

# set work directory
WORKDIR /app


RUN apt update; apt install -y curl


RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-linux-x86_64.tar.gz
RUN tar xzvf filebeat-7.17.10-linux-x86_64.tar.gz

COPY filebeat.yml /app/filebeat-7.17.10-linux-x86_64/filebeat.yml
RUN chmod go-w /app/filebeat-7.17.10-linux-x86_64/filebeat.yml
COPY entrypoint.sh /app/entrypoint.sh


# set env variables: PYTHONDONTWRITEBYTECODE 1  Prevents Python from writing pyc files to disc AND PYTHONUNBUFFERED 1 Prevents Python from buffering stdout and stderr 
# ENV PYTHONDONTWRITEBYTECODE 1 
# ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY ./app .


# CMD ["uvicorn", "main:app", "--host", "0.0.0.0" ,"--port", "8000"]

ENTRYPOINT ["/app/entrypoint.sh"]