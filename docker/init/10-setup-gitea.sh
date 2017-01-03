#!/bin/bash

curl https://dl.gitea.io/gitea/1.0.0/gitea-1.0.0-linux-amd64 > /app/gitea/gitea

mkdir -p /etc/service/99-gitea

cp /app/gitea/docker/gitea.sh /etc/service/99-gitea/run

chmod -R 775 /etc/service/99-gitea
chown -R git:root /etc/service/99-gitea

export GITEA_CUSTOM=/data/gitea
echo "export GITEA_CUSTOM=${GITEA_CUSTOM}" >> /etc/profile

mkdir /data
chown -R git:root /data /app/gitea /app/gitea/*
chmod 0775 /data /app/gitea /app/gitea/gitea
cp /app/gitea/docker/init/00-init-git-user-and-folders.sh /etc/my_init.d/99-gitea
