FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ssh

RUN apt-get install sshpass

ENTRYPOINT ["sshpass"]