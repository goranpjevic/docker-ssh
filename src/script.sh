#!/bin/bash

cp ~/.ssh/id_rsa.pub id_rsa.pub

echo "FROM alpine:latest
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN apk update
RUN apk add openssh
RUN chmod 700 /root/.ssh
RUN ssh-keygen -A
RUN sed -i s/^#PermitRootLogin\ prohibit-password/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo \"root:abc\" | chpasswd
CMD [\"/usr/sbin/sshd\", \"-D\", \"-e\"]" > Dockerfile

docker build -t docker-ssh-image .

docker_id=$(docker run -it --name docker-ssh-container -p 9090:22 -d docker-ssh-image)

ssh -o HostKeyAlgorithms=ssh-rsa root@0.0.0.0 -p 9090
