FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \ 
    openjdk-21-jdk \
    gradle \
    docker.io

ENV JAVA_HOME=/usr/lib/jvm/java-121-openjdk-amd64

RUN usermod -aG docker jenkins

USER jenkins