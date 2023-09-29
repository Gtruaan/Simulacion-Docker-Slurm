FROM ubuntu:latest

# Install stuff
RUN apt-get update && \
    apt-get install -y wget nano ssh openssh-server
RUN apt update && apt install -y python3 python3-pip python3-dev build-essential libssl-dev libffi-dev libpq-dev

# SSH
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 600 ~/.ssh/authorized_keys
COPY /conf/config /root/.ssh
RUN chmod 600 /root/.ssh/config

EXPOSE 22

# Users
RUN echo 'root:1111' | chpasswd

RUN useradd -u 1000 nodegtruan
RUN echo 'nodegtruan:1111' | chpasswd
RUN usermod -aG sudo nodegtruan
RUN mkdir /home/nodegtruan

# Entrypoint script
COPY /scripts/bootstrap.sh /
ENTRYPOINT ["/bin/bash", "bootstrap.sh"]



