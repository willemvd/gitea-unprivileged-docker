FROM willemvd/ubuntu-unprivileged-git-ssh:latest
MAINTAINER willemvd <willemvd@github>

USER root

COPY ./docker /app/gitea/docker

RUN /app/gitea/docker/init/10-setup-gitea.sh && rm -rf docker

USER git

# persistent volume for the host ssh key and gitea data
VOLUME ["/etc/ssh/keys", "/data"]

EXPOSE 2222 3000

# Use baseimage-docker's init system.
ENTRYPOINT ["/sbin/my_init", "--"]
