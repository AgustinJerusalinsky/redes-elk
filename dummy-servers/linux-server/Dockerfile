#linux server with ssh
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openssh-server curl rsyslog

#create ssh directory
RUN mkdir /var/run/sshd


#configure rsyslog to remote server
RUN echo "*.* @logstash:5044" >> /etc/rsyslog.conf

#remove imklog because kernel is from host
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf


#create user 'redes' with password 'redes'
RUN useradd -m -d /home/redes -s /bin/bash redes
RUN echo 'redes:redes' | chpasswd

#install filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.10-amd64.deb
RUN dpkg -i filebeat-7.17.10-amd64.deb

#enable system module
RUN filebeat modules enable system

#copy filebeat config
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml


#ENTRYPOINT filebeat setup
ENTRYPOINT service filebeat start; service rsyslog start && /usr/sbin/sshd -D
