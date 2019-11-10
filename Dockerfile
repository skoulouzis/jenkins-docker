FROM jenkinsci/jenkins:lts

USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

ARG DOCKER_CE=19.03.4
RUN apt-get update && apt-get upgrade -y && apt-get install docker-ce -y
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list && \ 
    echo 'deb http://ftp.de.debian.org/debian testing main' | tee /etc/apt/sources.list && \
    apt update && apt install -y openjdk-11-jdk-headless python3 python3-pip python3-venv


RUN wget https://updates.jenkins-ci.org/latest/jenkins.war
RUN cp jenkins.war /usr/share/jenkins

RUN usermod -aG docker jenkins
