FROM ubuntu:latest

# Install stuff
RUN apt-get update && \
    apt-get install -y wget nano ssh openssh-server rpm
RUN apt update && apt install -y python3 python3-pip python3-dev libopenmpi-dev munge build-essential libssl-dev libffi-dev libpq-dev

# Silence
ARG DEBIAN_FRONTEND=noninteractive

# SSH
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 600 ~/.ssh/authorized_keys
COPY /conf/config /root/.ssh
RUN chmod 600 /root/.ssh/config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22 6817 6818 6819 3306 

# Users
RUN echo 'root:1111' | chpasswd
RUN addgroup slurm
RUN usermod -aG slurm root

# SLURM install and setup
RUN apt install slurmd slurm-client slurmctld -y
COPY /conf/slurm.conf /etc/slurm/
COPY /conf/cgroup.conf /etc/slurm/

# Permissions
RUN chmod -R 777 /var/spool 

# Test Job
RUN mkdir /test-job
COPY /test-job /test-job

# Entrypoint script
COPY /scripts/bootstrap.sh /
ENTRYPOINT ["bin/bash", "bootstrap.sh"]
