FROM jenkinsci/jenkins:latest
USER root
ENV DOCKER_VERSION 1.11.0

# URL valid only for docker v1.11 and above
RUN curl -fsSL --create-dirs --output docker.tgz "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}".tgz && \
    tar -xzf docker.tgz && \
    mv docker/* /usr/bin && \
    rmdir docker

