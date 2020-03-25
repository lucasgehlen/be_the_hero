#
# Semana Omnistack Dockerfile
#

# Pull base image.
FROM ubuntu:18.04

ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=1234


# Installing essentials
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl git htop man unzip vim wget bash-completion

# Installing nvm, npm, npx and nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Adding host user to docker as sudoer 
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd
RUN apt-get install -y sudo
RUN adduser ${USER} sudo

USER ${UID}:${GID}

# Set environment variables.
ENV HOME /home/${USER}

# Define working directory.
WORKDIR /home/${USER}

# Define default command.
CMD ["bash"]
