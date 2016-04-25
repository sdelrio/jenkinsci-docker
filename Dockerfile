FROM jenkinsci/jenkins:latest
USER root
ENV DOCKER_VERSION 1.11.0
ENV DOCKER_GID 994

# URL valid only for docker v1.11 and above
RUN curl -fsSL --create-dirs --output docker.tgz "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}".tgz && \
    tar -xzf docker.tgz && \
    mv docker/* /usr/bin && \
    rmdir docker

RUN groupadd -g ${DOCKER_GID} docker
RUN usermod -aG docker jenkins

USER jenkins
