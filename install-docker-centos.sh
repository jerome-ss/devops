#!/bin/bash

yum remove docker docker-common docker-selinux docker-engine
yum install -y yum-utils  device-mapper-persistent-data lvm2
yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /bin/docker-compose
chmod +x /bin/docker-compose

gpasswd -a ${USER} docker

systemctl enable docker
systemctl start docker