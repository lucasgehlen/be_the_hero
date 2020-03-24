#
# Semana Omnistack Dockerfile
#

# Pull base image.
FROM ubuntu:18.04

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

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root/app

#RUN cd /root && git clone https://github.com/lucasgehlen/semana_omnistack_11.git

# Define default command.
CMD ["bash"]
