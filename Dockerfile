# syntax=docker/dockerfile:1

# Alpine is chosen for its small footprint
# compared to Ubuntu

FROM python:3.11-alpine3.16
RUN apk add --no-cache curl

# install kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install ansible
RUN apk add --no-cache openssh-client ansible git py3-mysqlclient
RUN ansible-galaxy collection install community.digitalocean community.mysql

# docker run --rm -it cohenaj194/docker-kube-cli sh
