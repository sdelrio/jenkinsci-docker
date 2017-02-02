FROM jenkins:2.32.2-alpine
USER root
RUN apk update && apk add tzdata && rm -rf /var/cache/apk/*
COPY plugins.txt /usr/share/jenkins/ref/
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy

ENV DOCKER_VERSION 1.13.0

# URL valid only for docker v1.11 and above
RUN curl -fsSL --create-dirs --output docker.tgz "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}".tgz && \
    tar -xzf docker.tgz && \
    mv docker/* /usr/bin && \
    rmdir docker

RUN apk update && apk add python py-pip && pip install --upgrade pip && pip install docker-compose && apk del py-pip && rm -rf /var/cache/apk/*

