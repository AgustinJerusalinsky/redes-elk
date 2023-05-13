#linux server with ssh
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openssh-server
RUN service ssh start


#create user 'redes' with password 'redes'
RUN useradd -m -d /home/redes -s /bin/bash redes
RUN echo 'redes:redes' | chpasswd


ENTRYPOINT ["/usr/sbin/sshd", "-D"]