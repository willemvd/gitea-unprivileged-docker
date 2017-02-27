# Gitea for unprivileged Docker

To support Gitea on an environment where no root user is allowed to run, like OpenShift Dedicated/Online, this Docker image can be used.

The base image for this Gitea container is the Gitea official image

To be able to do so, we run 
- the OpenSSH server on port 2222 instead of 22
- don't use syslogd, but let sshd print to stdout/stderr instead of file