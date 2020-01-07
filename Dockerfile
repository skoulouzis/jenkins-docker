FROM jenkinsci/jenkins:lts

USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

ARG DOCKER_CE=19.03.4
RUN apt-get update && apt-get upgrade -y && apt-get install docker-ce -y
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list &&  apt update && apt install -y openjdk-11-jdk-headless python3 python3-pip python3-venv


RUN wget https://updates.jenkins-ci.org/latest/jenkins.war
RUN cp jenkins.war /usr/share/jenkins

# RUN rm jenkins_keystore.jks
# ARG JENKINS_KEYSTORE_URL 
# RUN wget $JENKINS_KEYSTORE_URL -o jenkins_keystore.jks
# RUN mkdir -p /etc/jenkins
# RUN cp jenkins_keystore.jks /etc/jenkins/
# 
# #configure permissions to secure your keystore
# RUN chown -R jenkins: /etc/jenkins
# RUN chmod 700 /etc/jenkins
# RUN chmod 600 /etc/jenkins/jenkins_keystore.jks
# RUN ls /etc/
# 
RUN usermod -aG docker jenkins

# docker build --build-arg some_variable_name=a_value
# sudo docker build --build-arg JENKINS_KEYSTORE_URL=https://github.com/skoulouzis/jenkins-docker/raw/master/jenkins_keystore.jks -t jenkins .
