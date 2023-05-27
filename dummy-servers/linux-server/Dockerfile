#linux server with ssh
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openssh-server

#install syslog
RUN apt-get install -y rsyslog

#configure rsyslog to remote server
RUN echo "*.* @logstash:5044" >> /etc/rsyslog.conf

#remove imklog because kernel is from host
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf


#create user 'redes' with password 'redes'
RUN useradd -m -d /home/redes -s /bin/bash redes
RUN echo 'redes:redes' | chpasswd

RUN mkdir /var/run/sshd

ENTRYPOINT service rsyslog start && /usr/sbin/sshd -D
